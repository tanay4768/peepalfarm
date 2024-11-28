import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peepalfram/services/validation.dart';
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
      colorText: const Color.fromARGB(255, 62, 3, 3),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void showResetDialog() {
    TextEditingController emailController = TextEditingController();
    Get.defaultDialog(
        title: "Reset password",
        middleText: "Please enter your email to follow us:",
        backgroundColor: CustomColors.white,
        titleStyle: TextStyle(color: CustomColors.blue),
        middleTextStyle: TextStyle(color: CustomColors.blue),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter your email",
              hintStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.email, color: CustomColors.blue),
            ),
          ),
        ),
        textConfirm: "Submit",
        confirmTextColor: Colors.white,
        buttonColor: CustomColors.blue,
        onConfirm: () async {
          String email = emailController.text;
          if (Validator.validateEmail(email)) {
            try {
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              Get.back();
               showCustomSnackbar("Success", "Link Sent to $email");
            } catch (e) {
              showCustomSnackbar("Error", e.toString());
            }
          } else {
            showCustomSnackbar("Error", "Please enter a valid email address.");
          }
        });
  }
}
