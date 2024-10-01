import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool isPassword;
  final Function(String) onChanged;
  final String? Function(String?) validator;

  CustomInputField({
    required this.labelText,
    required this.icon,
    this.isPassword = false,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      obscureText: isPassword,
      validator: validator,
      onChanged: onChanged,
    );
  }
}