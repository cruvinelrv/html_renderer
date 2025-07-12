import 'package:flutter/material.dart';
// ...existing code...

import '../utils/parsers/html_list_parser.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildOrderedListWidget extends StatelessWidget {
  final String block;
  final TextStyle? style;
  final TextAlign? textAlign;

  const BuildOrderedListWidget({super.key, required this.block, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyMedium;
    final List<String> items = HtmlListParser.parseList(block);

    return Container(
      margin: const EdgeInsets.only(bottom: HtmlParserStrings.defaultListSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            items.asMap().entries.map((entry) {
              final int index = entry.key;
              final String item = entry.value;

              return Container(
                margin: EdgeInsets.only(
                  bottom: index == items.length - 1 ? 0 : HtmlParserStrings.defaultListItemSpacing,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: HtmlParserStrings.defaultBulletSpacing,
                        top: HtmlParserStrings.defaultBulletOffset,
                        left: 8.0,
                      ),
                      child: Text(
                        '${index + 1}.',
                        style: (style ?? defaultTextStyle)?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: style ?? defaultTextStyle?.copyWith(color: Colors.black87),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
