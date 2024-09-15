import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

class OptionRowWidget extends StatelessWidget {
  const OptionRowWidget({
    super.key,
    required this.text,
    required this.leftIcon,
    this.onTap,
    this.hasRightArrow = true,
  });

  final Widget leftIcon;
  final String text;
  final VoidCallback? onTap;
  final bool hasRightArrow;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                leftIcon,
                const SizedBox(width: 10),
                Text(text, style: const TextStyle(fontSize: 16)),
                const Spacer(),
                hasRightArrow
                    ? SvgPicture.asset(ProfileIcons.arrow)
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
