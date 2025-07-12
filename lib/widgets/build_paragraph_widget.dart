import 'package:flutter/material.dart';
import '../utils/html_text_styles.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildParagraphWidget extends StatelessWidget {
  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;

  const BuildParagraphWidget({super.key, required this.content, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HtmlParserStrings.defaultParagraphSpacing),
      child: Text(
        content,
        style: style ?? getBodyTextStyle(),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
