import 'package:flutter/material.dart';

abstract interface class HtmlParser {
  List<Widget> parseHtml(
    String html, {
    TextStyle? style,
    TextAlign? textAlign,
  });
}
