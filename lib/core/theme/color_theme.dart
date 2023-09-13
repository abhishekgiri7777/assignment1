import 'package:flutter/material.dart';

class MyColors {
  static Color mainColor = hexToColor("#FEC4C4");
  static Color whiteColor = hexToColor("#FFFFFF");
  static Color blackColor = hexToColor("#000000");

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
