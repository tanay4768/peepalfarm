import 'package:flutter/material.dart';

class Validator {
  static bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  static bool validatePasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool isFieldEmpty(String field) {
    return field.isEmpty;
  }

  static bool validateForm(
    BuildContext context,
    String email,
    String password,
    String confirmPassword,
  ) {
    bool isValid = true;

    if (isFieldEmpty(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      isValid = false;
    }

    if (isFieldEmpty(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password')),
      );
      isValid = false;
    }

    if (isFieldEmpty(confirmPassword)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please confirm your password')),
      );
      isValid = false;
    }

    if (!validateEmail(email)) {
      
      isValid = false;
    }

    if (!validatePasswordMatch(password, confirmPassword)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      isValid = false;
    }

    if (isValid) {
      Navigator.pushNamed(context, '/login');
    }

    return isValid;
  }
}