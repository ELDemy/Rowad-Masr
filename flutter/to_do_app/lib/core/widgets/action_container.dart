import 'package:flutter/material.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    super.key,
    required this.text,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.onTap,
  });

  final String text;
  final Color? backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: 154,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            height: 24.08 / 16,
            fontWeight: FontWeight.w400,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
