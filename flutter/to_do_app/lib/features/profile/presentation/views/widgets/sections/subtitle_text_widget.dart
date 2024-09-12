import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xffAFAFAF),
        ),
      ),
    );
  }
}
