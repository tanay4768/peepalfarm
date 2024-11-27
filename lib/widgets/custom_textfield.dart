import 'package:flutter/material.dart';
import 'package:peepalfram/utils/ui/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the error border should be shown
    final isError = (errorText ?? "").isNotEmpty;

    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        errorText: isError
            ? errorText
            : null, // Show error text only if it is not null
        errorStyle: const TextStyle(
          color: Colors.red, // Customize error text color
          fontSize: 12, // Customize error text size
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
