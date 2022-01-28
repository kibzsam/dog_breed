import 'package:flutter/material.dart';

import 'Palette.dart';

class Themes {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: Palette.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    fontFamily: 'Poppins-Regular',
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(borderSide: BorderSide(color: Palette.textFieldUnderlineColor, width: 1)),
      labelStyle: TextStyle(color: Palette.secondaryTextColor, fontFamily: 'Poppins-Regular', fontSize: 12),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Palette.textFieldUnderlineColor, width: 1)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Palette.textFieldUnderlineColor, width: 1)),
    ),
  );
}
