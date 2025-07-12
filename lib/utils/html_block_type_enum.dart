enum HtmlBlockTypeEnum {
  table,
  heading,
  span,
  paragraph,
  unorderedList,
  orderedList,
  lineBreak,
  plainText,
  unknown;

  static HtmlBlockTypeEnum fromString(String value) {
    switch (value.toLowerCase()) {
      case 'table':
        return HtmlBlockTypeEnum.table;
      case 'heading':
        return HtmlBlockTypeEnum.heading;
      case 'span':
        return HtmlBlockTypeEnum.span;
      case 'paragraph':
        return HtmlBlockTypeEnum.paragraph;
      case 'unorderedlist':
        return HtmlBlockTypeEnum.unorderedList;
      case 'orderedlist':
        return HtmlBlockTypeEnum.orderedList;
      case 'linebreak':
        return HtmlBlockTypeEnum.lineBreak;
      case 'plaintext':
        return HtmlBlockTypeEnum.plainText;
      default:
        return HtmlBlockTypeEnum.unknown;
    }
  }
}
