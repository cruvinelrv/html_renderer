import 'package:flutter/material.dart';

import '../utils/strings/html_parser_strings.dart';
import '../utils/html_color_utils.dart';

class HtmlErrorWidget extends StatelessWidget {
  final String block;

  /// A widget that displays an error message when an HTML block cannot be processed.
  const HtmlErrorWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      color: const Color.fromARGB(20, 255, 0, 0),
      child: Row(
        children: [
          Icon(Icons.error, color: parseHtmlColor('red'), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${HtmlParserStrings.errorProcessingBlock} $block',
              style: TextStyle(color: parseHtmlColor('red')),
            ),
          ),
        ],
      ),
    );
  }
}
