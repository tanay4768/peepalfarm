import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/sizeconfig.dart';

class CustomTexttheme {
  static TextTheme lightTheme = TextTheme(
      displayLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.fortyEight,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.forty,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.twentyFour,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.fourteen,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.twelve,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.fourteen,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.twelve,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: CustomColors.black,
        fontSize: SizeConfig.ten,
        fontWeight: FontWeight.bold,
      ),
    );

  static TextTheme darkTheme = TextTheme(
      displayLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.fortyEight,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.forty,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.thirtyTwo,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.twentyFour,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.sixteen,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.fourteen,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.twelve,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.fourteen,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.twelve,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: CustomColors.white,
        fontSize: SizeConfig.ten,
        fontWeight: FontWeight.bold,
      ),
  );
}
