import 'package:flutter/material.dart';

class HighlightedContainer extends StatelessWidget {
  const HighlightedContainer({
    super.key,
    this.margin = const EdgeInsets.all(0),
    required this.width,
    required this.height,
  });

  final EdgeInsetsGeometry margin;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: const Color(0xFFE35432),
        border: Border.all(color: const Color(0xFF4DFC19), width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
