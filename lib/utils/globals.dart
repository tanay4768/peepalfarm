import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';

class Globals {
  static void showCustomSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: CustomColors.green,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

}