import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';
import 'package:peepalfram/utils/ui/sizeconstraints/sizeconfig.dart';

class CcardTheme {
  static CardTheme lightmode = CardTheme(
      color: CustomColors.parwhite,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent ,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.sixteen)));
  static CardTheme darkmode = CardTheme(
      color: CustomColors.parblack,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.sixteen)));
}
