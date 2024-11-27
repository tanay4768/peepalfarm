import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/customthemes/ccard_theme.dart';
import 'package:peepalfram/utils/ui/customthemes/cinput_theme.dart';
import 'package:peepalfram/utils/ui/customthemes/custom_texttheme.dart';
import 'package:peepalfram/utils/ui/customthemes/elevatedbtn_theme.dart';


class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.primary,
    hintColor: CustomColors.black,
    scaffoldBackgroundColor: CustomColors.blue,
    textTheme: CustomTexttheme.lightTheme,
    cardTheme: CcardTheme.lightmode,
    appBarTheme: AppBarTheme(
      color: CustomColors.white,
      iconTheme: IconThemeData(color: CustomColors.black),
      titleTextStyle: TextStyle(color: CustomColors.black, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedbtnTheme.lightmode,
    inputDecorationTheme: CinputTheme.lightmode
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: CustomColors.black,
      hintColor: CustomColors.white,
      scaffoldBackgroundColor: CustomColors.green,
      textTheme: CustomTexttheme.darkTheme,
      cardTheme: CcardTheme.darkmode,
      appBarTheme: AppBarTheme(
        color: CustomColors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        titleTextStyle: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedbtnTheme.darkmode,
      inputDecorationTheme: CinputTheme.darkmode
      );
}
