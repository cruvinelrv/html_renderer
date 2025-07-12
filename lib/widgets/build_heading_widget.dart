import 'package:flutter/material.dart';
import '../utils/html_text_styles.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildHeadingWidget extends StatelessWidget {
  /// The heading level (1-6).
  final int level;

  /// The text content of the heading.
  final String content;

  /// The text alignment for the heading.
  final TextAlign? textAlign;

  /// A widget that renders an HTML heading (h1-h6) with customizable level and content.
  const BuildHeadingWidget(
      {super.key, required this.level, required this.content, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: HtmlParserStrings.defaultHeadingSpacing),
      child: Text(
        content,
        style: getHeadingTextStyle(level),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
