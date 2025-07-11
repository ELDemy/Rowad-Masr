import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 8),
          Text(
            propName,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
