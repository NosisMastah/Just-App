import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?) validator;
  final ValueChanged<String> onChanged;

  CustomTextField({
    required this.labelText,
    required this.icon,
    this.isPassword = false,
    required this.validator,
    required this.onChanged,
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