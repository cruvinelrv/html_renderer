class HtmlParserStrings {
  static const String errorProcessingBlock = 'Erro ao processar bloco:';
  static const String invalidTable = 'Tabela inválida';

  // Tags HTML
  static const String paragraphOpenTag = '<p>';
  static const String paragraphCloseTag = '</p>';
  static const String unorderedListOpenTag = '<ul>';
  static const String unorderedListCloseTag = '</ul>';
  static const String orderedListOpenTag = '<ol>';
  static const String orderedListCloseTag = '</ol>';
  static const String lineBreakTag = '<br>';
  static const String lineBreakSelfClosingTag = '<br/>';
  static const String lineBreakSpacedTag = '<br />';
  static const String tableOpenTag = '<table';
  static const String tableCloseTag = '</table>';

  // Prefixos abertura de tags
  static const String headingPrefix = '<h';
  static const String tagClose = '>';
  static const String tagOpenPrefix = '<';
  static const String spanOpenTag = '<span';

  // Espaçamentos padrão
  static const double defaultParagraphSpacing = 12.0;
  static const double defaultListSpacing = 12.0;
  static const double defaultListItemSpacing = 6.0;
  static const double defaultHeadingSpacing = 16.0;
  static const double defaultTextSpacing = 8.0;
  static const double defaultLineBreakHeight = 8.0;
  static const double defaultBulletSpacing = 8.0;
  static const double defaultBulletOffset = 2.0;

  // Caracteres especiais
  static const String bulletChar = '•';
  static const String spaceChar = ' ';
  static const String emptyString = '';

  // Números de headings
  static const int minHeadingLevel = 1;
  static const int maxHeadingLevel = 6;
  static const int defaultHeadingLevel = 3;
}
