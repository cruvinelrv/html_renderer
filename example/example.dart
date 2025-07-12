import 'package:flutter/material.dart';
import 'package:html_renderer/html_renderer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('html_renderer Example')),
        body: HtmlRenderer(
          html:
              "<h1>Hello World</h1><p>This is an example of html_renderer.</p>",
        ),
      ),
    );
  }
}
