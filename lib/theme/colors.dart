import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray700 = fromHex('#666666');
  // black500
  static Color black500 = fromHex('#9e9e9e');

  static Color blueGray200 = fromHex('#b7b9d0');

  static Color deepOrangeA200 = fromHex('#f57d31');

  static Color gray500 = fromHex('#aaa67f');

  static Color lime700 = fromHex('#a7b723');

  static Color gray900 = fromHex('#212121');

  static Color deepPurple500 = fromHex('#70559b');

  static Color lime70001 = fromHex('#b69e31');

  static Color gray300 = fromHex('#e0e0e0');

  static Color gray100 = fromHex('#f7f7f7');

  static Color deepPurple200 = fromHex('#a891ec');

  static Color pinkA200 = fromHex('#fb5584');

  static Color yellow600 = fromHex('#f9cf30');

  static Color whiteA70063 = fromHex('#63ffffff');

  static Color lightGreen500 = fromHex('#74cb48');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color blue300 = fromHex('#6493eb');

  // blue 700
  static Color blueA700 = fromHex('#1a237e');

  static Color purple500 = fromHex('#a43e9e');

  static Color whiteA700 = fromHex('#ffffff');

  // red200
  static Color redA200 = fromHex('#f57d31');
  // red 700
  static Color redA700 = fromHex('#d32f2f');
  // brown 500
  static Color brown500 = fromHex('#795548');
  // indigoA200
  static Color indigoA200 = fromHex('#536dfe');
  // brown 300
  static Color brown300 = fromHex('#a1887f');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
