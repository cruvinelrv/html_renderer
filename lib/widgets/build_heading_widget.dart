import 'package:flutter/material.dart';
import '../utils/html_text_styles.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildHeadingWidget extends StatelessWidget {
  final int level;
  final String content;
  final TextAlign? textAlign;

  const BuildHeadingWidget({super.key, required this.level, required this.content, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HtmlParserStrings.defaultHeadingSpacing),
      child: Text(
        content,
        style: getHeadingTextStyle(level),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
