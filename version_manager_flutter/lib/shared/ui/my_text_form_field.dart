import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;

  const MyTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}
