import 'package:flutter/material.dart';

import 'html_parser.dart';
import 'utils/html_block_type_enum.dart';
import 'utils/html_cleaner.dart';
import 'utils/html_color_utils.dart';
import 'utils/html_text_styles.dart';
import 'utils/strings/html_parser_regex.dart';
import 'utils/strings/html_parser_strings.dart';
import 'widgets/build_heading_widget.dart';
import 'widgets/build_ordered_list_widget.dart';
import 'widgets/build_paragraph_widget.dart';
import 'widgets/build_table_widget.dart';
import 'widgets/build_unordered_list_widget.dart';
import 'widgets/html_error_widget.dart';

class HtmlParserImpl implements HtmlParser {
  @override
  List<Widget> parseHtml(String html,
      {TextStyle? style, TextAlign? textAlign}) {
    final List<Widget> widgets = [];

    final String cleanHtml = cleanHtmlContent(html);
    final List<String> blocks = _separateHtmlBlocks(cleanHtml);

    for (String block in blocks) {
      final Widget? widget = _buildWidgetFromBlock(block, style, textAlign);
      if (widget != null) {
        widgets.add(widget);
      }
    }
    return widgets;
  }

  List<String> _separateHtmlBlocks(String html) {
    final List<String> blocks = [];
    int lastIndex = 0;
    for (RegExpMatch match in HtmlParserRegex.tag.allMatches(html)) {
      if (match.start > lastIndex) {
        final String textBefore = html.substring(lastIndex, match.start).trim();
        if (textBefore.isNotEmpty) {
          blocks.add(textBefore);
        }
      }
      blocks.add(match.group(0) ?? HtmlParserStrings.emptyString);
      lastIndex = match.end;
    }
    if (lastIndex < html.length) {
      final String remainingText = html.substring(lastIndex).trim();
      if (remainingText.isNotEmpty) {
        blocks.add(remainingText);
      }
    }
    return blocks.where((block) => block.trim().isNotEmpty).toList();
  }

  Widget? _buildWidgetFromBlock(
      String block, TextStyle? style, TextAlign? textAlign) {
    final HtmlBlockTypeEnum type = _detectBlockType(block);
    switch (type) {
      case HtmlBlockTypeEnum.table:
        return BuildTableWidget(html: block);
      case HtmlBlockTypeEnum.heading:
        final RegExpMatch? match = HtmlParserRegex.heading.firstMatch(block);
        if (match != null) {
          final int level = int.parse(
            match.group(1) ?? HtmlParserStrings.defaultHeadingLevel.toString(),
          );
          final String content =
              match.group(2)?.trim() ?? HtmlParserStrings.emptyString;
          return BuildHeadingWidget(
              level: level, content: content, textAlign: textAlign);
        }
        return const SizedBox.shrink();
      case HtmlBlockTypeEnum.span:
        final List<InlineSpan> spans = [];
        final spanRegex = HtmlParserRegex.span;
        int lastIndex = 0;
        for (final match in spanRegex.allMatches(block)) {
          if (match.start > lastIndex) {
            final String before = block.substring(lastIndex, match.start);
            if (before.trim().isNotEmpty) {
              spans.add(
                  TextSpan(text: before, style: style ?? getBodyTextStyle()));
            }
          }
          final String? colorStr = match.group(1);
          final String content =
              match.group(2) ?? HtmlParserStrings.emptyString;
          final color = parseHtmlColor(colorStr, style?.color);
          spans.add(
            TextSpan(
                text: content,
                style: (style ?? getBodyTextStyle()).copyWith(color: color)),
          );
          lastIndex = match.end;
        }
        if (lastIndex < block.length) {
          final String after = block.substring(lastIndex);
          if (after.trim().isNotEmpty) {
            spans
                .add(TextSpan(text: after, style: style ?? getBodyTextStyle()));
          }
        }
        return Container(
          margin: const EdgeInsets.only(
              bottom: HtmlParserStrings.defaultTextSpacing),
          child: RichText(
            text: TextSpan(children: spans, style: style ?? getBodyTextStyle()),
            textAlign: textAlign ?? TextAlign.left,
          ),
        );
      case HtmlBlockTypeEnum.paragraph:
        final String content = block
            .replaceAll(
                HtmlParserRegex.paragraph, HtmlParserStrings.emptyString)
            .trim();
        return BuildParagraphWidget(
            content: content, style: style, textAlign: textAlign);
      case HtmlBlockTypeEnum.unorderedList:
        return BuildUnorderedListWidget(
            block: block, style: style, textAlign: textAlign);
      case HtmlBlockTypeEnum.orderedList:
        return BuildOrderedListWidget(
            block: block, style: style, textAlign: textAlign);
      case HtmlBlockTypeEnum.lineBreak:
        return const SizedBox(height: HtmlParserStrings.defaultLineBreakHeight);
      case HtmlBlockTypeEnum.plainText:
        return _buildTextWhithoutHtmlTags(block, style, textAlign);
      case HtmlBlockTypeEnum.unknown:
        return HtmlErrorWidget(block: block);
    }
  }

  HtmlBlockTypeEnum _detectBlockType(String block) {
    final b = block.trim();
    if (b.toLowerCase().startsWith(HtmlParserStrings.tableOpenTag) &&
        b.toLowerCase().endsWith(HtmlParserStrings.tableCloseTag)) {
      return HtmlBlockTypeEnum.table;
    }
    if (HtmlParserRegex.heading.hasMatch(b)) {
      return HtmlBlockTypeEnum.heading;
    }
    if (b.contains(HtmlParserStrings.spanOpenTag)) {
      return HtmlBlockTypeEnum.span;
    }
    if (b.startsWith(HtmlParserStrings.paragraphOpenTag) &&
        b.endsWith(HtmlParserStrings.paragraphCloseTag)) {
      return HtmlBlockTypeEnum.paragraph;
    }
    if (b.startsWith(HtmlParserStrings.unorderedListOpenTag) &&
        b.endsWith(HtmlParserStrings.unorderedListCloseTag)) {
      return HtmlBlockTypeEnum.unorderedList;
    }
    if (b.startsWith(HtmlParserStrings.orderedListOpenTag) &&
        b.endsWith(HtmlParserStrings.orderedListCloseTag)) {
      return HtmlBlockTypeEnum.orderedList;
    }
    if (b == HtmlParserStrings.lineBreakTag ||
        b == HtmlParserStrings.lineBreakSelfClosingTag ||
        b == HtmlParserStrings.lineBreakSpacedTag) {
      return HtmlBlockTypeEnum.lineBreak;
    }
    if (!b.startsWith(HtmlParserStrings.tagOpenPrefix)) {
      return HtmlBlockTypeEnum.plainText;
    }
    return HtmlBlockTypeEnum.unknown;
  }
}

Widget _buildTextWhithoutHtmlTags(
    String text, TextStyle? style, TextAlign? textAlign) {
  return Container(
    margin: const EdgeInsets.only(bottom: HtmlParserStrings.defaultTextSpacing),
    child: Text(text,
        style: style ?? getBodyTextStyle(),
        textAlign: textAlign ?? TextAlign.left),
  );
}
