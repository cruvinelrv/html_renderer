import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:html_renderer/html_renderer.dart';
import 'package:html_renderer/widgets/build_ordered_list_widget.dart';
import 'package:html_renderer/widgets/build_unordered_list_widget.dart';
import 'package:html_renderer/widgets/html_error_widget.dart';

void main() {
  group('HtmlRender widget', () {
    testWidgets('renders paragraph from HTML', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HtmlRenderer(html: '<p>Hello World</p>')));
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('renders heading from HTML', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HtmlRenderer(html: '<h1>Title</h1>')));
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('renders unordered list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BuildUnorderedListWidget(block: '<ul><li>Item 1</li><li>Item 2</li></ul>'),
        ),
      );
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('renders ordered list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: BuildOrderedListWidget(block: '<ol><li>First</li><li>Second</li></ol>')),
      );
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('renders error widget for unknown block', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HtmlErrorWidget(block: 'unknown block')));
      expect(find.textContaining('Erro ao processar bloco'), findsOneWidget);
    });
  });
}
