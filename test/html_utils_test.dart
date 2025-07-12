import 'package:flutter_test/flutter_test.dart';
import 'package:html_renderer/utils/html_color_utils.dart';
import 'package:html_renderer/utils/html_text_styles.dart';
import 'package:flutter/material.dart';

void main() {
  group('parseHtmlColor', () {
    test('returns correct color for hex', () {
      expect(parseHtmlColor('#FF0000'), equals(const Color(0xFFFF0000)));
    });
    test('returns correct color for named color', () {
      expect(parseHtmlColor('red'), equals(Colors.red));
      expect(parseHtmlColor('blue'), equals(Colors.blue));
      expect(parseHtmlColor('grey'), equals(Colors.grey));
    });
    test('returns fallback for unknown color', () {
      expect(parseHtmlColor('unknown', Colors.green), equals(Colors.green));
    });
    test('returns null for null input and no fallback', () {
      expect(parseHtmlColor(null), isNull);
    });
  });

  group('getBodyTextStyle', () {
    test('returns default body style', () {
      final style = getBodyTextStyle();
      expect(style.fontSize, 16);
      expect(style.color, Colors.black87);
    });
    test('returns body style with custom color', () {
      final style = getBodyTextStyle(color: Colors.purple);
      expect(style.color, Colors.purple);
    });
  });

  group('getHeadingTextStyle', () {
    test('returns correct style for each heading level', () {
      expect(getHeadingTextStyle(1).fontSize, 32);
      expect(getHeadingTextStyle(2).fontSize, 28);
      expect(getHeadingTextStyle(3).fontSize, 24);
      expect(getHeadingTextStyle(4).fontSize, 20);
      expect(getHeadingTextStyle(5).fontSize, 18);
      expect(getHeadingTextStyle(6).fontSize, 16);
      expect(getHeadingTextStyle(99).fontSize, 24);
    });
    test('returns bold weight for headings', () {
      expect(getHeadingTextStyle(1).fontWeight, FontWeight.bold);
    });
  });
}
