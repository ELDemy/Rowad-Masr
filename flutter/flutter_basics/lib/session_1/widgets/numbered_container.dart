import 'package:flutter/material.dart';

class NumberedContainer extends StatelessWidget {
  const NumberedContainer(
    this.text, {
    super.key,
    this.color = Colors.blue,
    this.height = 50,
    this.width = 50,
  });

  final String text;
  final Color color;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: width,
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
