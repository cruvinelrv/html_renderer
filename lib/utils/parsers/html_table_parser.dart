import 'package:html_renderer/utils/strings/html_parser_strings.dart';

import '../strings/html_parser_regex.dart';

class HtmlTableParser {
  static List<List<String>> parseTable(String html) {
    final tableRegExp = HtmlParserRegex.table;
    final rowRegExp = HtmlParserRegex.row;
    final headerCellRegExp = HtmlParserRegex.headerCell;
    final dataCellRegExp = HtmlParserRegex.dataCell;

    final tableMatch = tableRegExp.firstMatch(html);
    if (tableMatch == null) return [];

    final tableContent = tableMatch.group(0)!;
    final rows = <List<String>>[];

    for (final rowMatch in rowRegExp.allMatches(tableContent)) {
      final row = rowMatch.group(0)!;
      final headers =
          headerCellRegExp
              .allMatches(row)
              .map(
                (cellMatch) =>
                    HtmlParserRegex.thContent.firstMatch(cellMatch.group(0)!)?.group(1)?.trim() ??
                    HtmlParserStrings.emptyString,
              )
              .toList();
      final data =
          dataCellRegExp
              .allMatches(row)
              .map(
                (cellMatch) =>
                    HtmlParserRegex.tdContent.firstMatch(cellMatch.group(0)!)?.group(1)?.trim() ??
                    HtmlParserStrings.emptyString,
              )
              .toList();
      rows.add(headers.isNotEmpty ? headers : data);
    }
    return rows;
  }
}
