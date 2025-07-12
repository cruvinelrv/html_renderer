import 'package:flutter/material.dart';

import '../utils/parsers/html_list_parser.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildOrderedListWidget extends StatelessWidget {
  /// The HTML block containing the ordered list.
  final String block;

  /// The text style for list items.
  final TextStyle? style;

  /// The text alignment for list items.
  final TextAlign? textAlign;

  /// A widget that renders an HTML ordered list (<ol>) with customizable styling.
  const BuildOrderedListWidget(
      {super.key, required this.block, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyMedium;
    final List<String> items = HtmlListParser.parseList(block);

    return Container(
      margin:
          const EdgeInsets.only(bottom: HtmlParserStrings.defaultListSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.asMap().entries.map((entry) {
          final int index = entry.key;
          final String item = entry.value;

          return Container(
            margin: EdgeInsets.only(
              bottom: index == items.length - 1
                  ? 0
                  : HtmlParserStrings.defaultListItemSpacing,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: HtmlParserStrings.defaultBulletSpacing,
                    top: HtmlParserStrings.defaultBulletOffset,
                    left: 8.0,
                  ),
                  child: Text(
                    '${index + 1}.',
                    style: (style ?? defaultTextStyle)?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: style ??
                        defaultTextStyle?.copyWith(color: Colors.black87),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
