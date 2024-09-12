import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        "Settings",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xffAFAFAF),
        ),
      ),
    );
  }
}
