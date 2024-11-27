import 'package:flutter/material.dart';

class Validator {
  static bool validateEmail(String email) {
    // Regular expression for email validation
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
      // Show error message for empty email field
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      isValid = false;
    }

    if (isFieldEmpty(password)) {
      // Show error message for empty password field
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password')),
      );
      isValid = false;
    }

    if (isFieldEmpty(confirmPassword)) {
      // Show error message for empty confirm password field
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please confirm your password')),
      );
      isValid = false;
    }

    if (!validateEmail(email)) {
      
      isValid = false;
    }

    if (!validatePasswordMatch(password, confirmPassword)) {
      // Show error message for password mismatch
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      isValid = false;
    }

    if (isValid) {
      // Navigate to the Login screen
      Navigator.pushNamed(context, '/login');
    }

    return isValid;
  }
}