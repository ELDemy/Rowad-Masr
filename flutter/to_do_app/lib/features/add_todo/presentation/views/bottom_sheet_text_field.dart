import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class BottomSheetTextFormField extends StatelessWidget {
  const BottomSheetTextFormField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText = false});

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyOutline,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
    );
  }
}
