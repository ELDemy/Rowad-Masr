import 'package:flutter/material.dart';

class DialogTextFormField extends StatelessWidget {
  const DialogTextFormField(
      {super.key, required this.controller, this.labelText});

  final TextEditingController controller;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
