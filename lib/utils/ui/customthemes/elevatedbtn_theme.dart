import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconfig.dart';

class ElevatedbtnTheme {
  static ElevatedButtonThemeData lightmode = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.black,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.twelve),
      ),
      minimumSize: Size(SizeConfig.twoEighty, SizeConfig.forty), // Size
    ),
  );
  
    static ElevatedButtonThemeData darkmode = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.white,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: SizeConfig.twenty,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.twelve),
      ),
      minimumSize: Size(SizeConfig.twoEighty, SizeConfig.forty), // Size
    ),
  );
}
