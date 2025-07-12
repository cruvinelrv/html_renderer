import 'strings/html_parser_regex.dart';

String cleanHtmlContent(String html) {
  if (html.isEmpty) return '';
  String cleaned = html.replaceAll(HtmlParserRegex.whitespace, ' ');
  cleaned = cleaned.trim();
  return cleaned;
}
