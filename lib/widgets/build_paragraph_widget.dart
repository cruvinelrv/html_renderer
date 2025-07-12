import 'package:flutter/material.dart';
import '../utils/html_text_styles.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildParagraphWidget extends StatelessWidget {
  /// The text content of the paragraph.
  final String content;

  /// The text style for the paragraph.
  final TextStyle? style;

  /// The text alignment for the paragraph.
  final TextAlign? textAlign;

  /// A widget that renders an HTML paragraph (<p>) with customizable styling.
  const BuildParagraphWidget(
      {super.key, required this.content, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: HtmlParserStrings.defaultParagraphSpacing),
      child: Text(
        content,
        style: style ?? getBodyTextStyle(),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
