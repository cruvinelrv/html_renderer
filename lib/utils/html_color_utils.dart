import 'package:flutter/material.dart';

Color? parseHtmlColor(String? colorStr, [Color? fallback]) {
  if (colorStr == null) return fallback;
  if (colorStr.startsWith('#')) {
    try {
      return Color(int.parse('0xFF${colorStr.substring(1)}'));
    } catch (_) {
      return fallback;
    }
  }
  switch (colorStr.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    case 'brown':
      return Colors.brown;
    case 'grey':
    case 'gray':
      return Colors.grey;
    default:
      return fallback;
  }
}
