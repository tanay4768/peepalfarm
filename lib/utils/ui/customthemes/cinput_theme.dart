import 'package:flutter/material.dart';

class CinputTheme {
  static InputDecorationTheme lightmode = const InputDecorationTheme(
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    hintStyle: TextStyle(color: Colors.black),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
    )
  )
  ;
    static InputDecorationTheme darkmode = const InputDecorationTheme(
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    hintStyle: TextStyle(color: Colors.white),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1),
    )
  )
  ;
}
