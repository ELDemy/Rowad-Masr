import 'package:flutter/material.dart';

class DialogTextFormField extends StatelessWidget {
  const DialogTextFormField(
      {super.key,
      required this.controller,
      this.labelText,
      this.obscureText = false});

  final TextEditingController controller;
  final String? labelText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
