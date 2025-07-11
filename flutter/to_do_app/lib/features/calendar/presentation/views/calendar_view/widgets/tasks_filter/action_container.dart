import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    super.key,
    required this.text,
    this.onTap,
    required this.filter,
  });

  final String text;
  final bool filter;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 137,
        decoration: conditionalBoxDecoration(),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  BoxDecoration conditionalBoxDecoration() {
    return filter
        ? BoxDecoration(
            color: AppColors.purplePrimaryColor,
            borderRadius: BorderRadius.circular(4),
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color(0xff979797),
              width: 2,
            ),
          );
  }
}
