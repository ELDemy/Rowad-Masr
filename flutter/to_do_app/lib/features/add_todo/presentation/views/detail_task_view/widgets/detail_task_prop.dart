import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/utiles/icons.dart';

class DetailTaskProp extends StatelessWidget {
  const DetailTaskProp({
    super.key,
    required this.iconPath,
    required this.propName,
    required this.child,
  });

  final String iconPath;
  final String propName;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(TaskIcons.timer),
        const SizedBox(width: 8),
        const Text(
          "Task Time :",
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            "Today At 16:45",
            style: TextStyle(fontSize: 12, height: 21 / 12),
          ),
        )
      ],
    );
  }
}
