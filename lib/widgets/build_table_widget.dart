import 'package:flutter/material.dart';

import '../utils/parsers/html_table_parser.dart';
import '../utils/strings/html_parser_strings.dart';

class BuildTableWidget extends StatelessWidget {
  final String html;
  final TextStyle? headerStyle;
  final TextStyle? cellStyle;

  const BuildTableWidget(
      {super.key, required this.html, this.headerStyle, this.cellStyle});

  @override
  Widget build(BuildContext context) {
    final rows = HtmlTableParser.parseTable(html);
    if (rows.isEmpty) {
      return const Text(HtmlParserStrings.invalidTable);
    }
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows
          .map(
            (cells) => TableRow(
              children: cells.asMap().entries.map((entry) {
                final isHeader = rows.indexOf(cells) == 0;
                return TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      entry.value,
                      style: isHeader
                          ? (headerStyle ??
                              const TextStyle(fontWeight: FontWeight.bold))
                          : cellStyle,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
          .toList(),
    );
  }
}
