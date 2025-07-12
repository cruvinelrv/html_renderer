import '../strings/html_parser_regex.dart';
import '../strings/html_parser_strings.dart';

class HtmlListParser {
  static List<String> parseList(String block) {
    return HtmlParserRegex.li
        .allMatches(block)
        .map((match) => match.group(1)?.trim() ?? HtmlParserStrings.emptyString)
        .where((item) => item.isNotEmpty)
        .toList();
  }
}
