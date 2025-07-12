class HtmlParserRegex {
  static final RegExp span = RegExp(
      r'<span(?:\s+style="color:\s*(#[0-9A-Fa-f]{6}|[a-zA-Z]+);?"|)>(.*?)<\/span>',
      dotAll: true);
  static final RegExp tag = RegExp(
      r'<(p|ul|h[1-6]|br\s*\/?)\b.*?>(.*?)<\/\1>|<br\s*\/?>',
      dotAll: true);
  static final RegExp li = RegExp(r'<li>(.*?)<\/li>', dotAll: true);
  static final RegExp heading =
      RegExp(r'<h([1-6]).*?>(.*?)<\/h\1>', dotAll: true);
  static final RegExp paragraph = RegExp(r'</?p>');
  static final RegExp whitespace = RegExp(r'\s+');
  static final RegExp table =
      RegExp(r'<table[\s\S]*?<\/table>', caseSensitive: false);
  static final RegExp row = RegExp(r'<tr[\s\S]*?<\/tr>', caseSensitive: false);
  static final RegExp headerCell =
      RegExp(r'<th[\s\S]*?<\/th>', caseSensitive: false);
  static final RegExp dataCell =
      RegExp(r'<td[\s\S]*?<\/td>', caseSensitive: false);
  static final RegExp thContent =
      RegExp(r'<th[\s\S]*?>([\s\S]*?)<\/th>', caseSensitive: false);
  static final RegExp tdContent =
      RegExp(r'<td[\s\S]*?>([\s\S]*?)<\/td>', caseSensitive: false);
}
