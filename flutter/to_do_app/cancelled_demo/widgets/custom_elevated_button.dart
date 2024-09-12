import 'package:flutter/material.dart';

import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.width, required this.child});

  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(width, 65.7)),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
      child: child,
    );
  }
}
