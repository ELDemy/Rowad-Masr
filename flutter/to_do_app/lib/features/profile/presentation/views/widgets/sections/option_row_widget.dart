import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

class OptionRowWidget extends StatelessWidget {
  const OptionRowWidget({
    super.key,
    required this.text,
    required this.leftIcon,
    this.onTap,
  });

  final Widget leftIcon;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          leftIcon,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          SvgPicture.asset(ProfileIcons.arrow),
        ],
      ),
    );
  }
}
