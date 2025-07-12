import 'package:flutter/material.dart';
import 'html_parser_impl.dart';

class HtmlRender extends StatelessWidget {
  final String html;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  const HtmlRender({super.key, required this.html, this.style, this.textAlign, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: HtmlParserImpl().parseHtml(html, style: style, textAlign: textAlign),
      ),
    );
  }
}
