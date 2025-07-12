import 'package:flutter/material.dart';
// ...existing code...

TextStyle getBodyTextStyle({Color? color}) {
  return TextStyle(fontSize: 16, color: color ?? Colors.black87);
}

TextStyle getHeadingTextStyle(int level) {
  final color = Colors.black;
  switch (level) {
    case 1:
      return TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color);
    case 2:
      return TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color);
    case 3:
      return TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
    case 4:
      return TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
    case 5:
      return TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color);
    case 6:
      return TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);
    default:
      return TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);
  }
}
