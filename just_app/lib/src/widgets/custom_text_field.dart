import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?) validator;
  final TextEditingController controller;

  CustomTextField({
    required this.labelText,
    required this.icon,
    this.isPassword = false,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      controller: controller,
      obscureText: isPassword,
      validator: validator,
    );
  }
}