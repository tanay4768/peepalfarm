import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';

class CustomTexttheme {
  static TextTheme lightmode = TextTheme(
    bodyLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.w800),
    bodyMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.w600),
    bodySmall: TextStyle(
      color: CustomColors.black,
      fontSize: SizeConfig.fourteen,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.forty,
        fontWeight: FontWeight.bold),
  );

  static TextTheme darkmode = TextTheme(
    bodyLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.w800),
    bodyMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.w600),
    bodySmall: TextStyle(
      color: CustomColors.white,
      fontSize: SizeConfig.fourteen,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.forty,
        fontWeight: FontWeight.bold),
  );
}
