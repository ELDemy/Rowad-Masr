import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

class OptionRowWidget extends StatelessWidget {
  const OptionRowWidget({
    super.key,
    required this.text,
    required this.leftIcon,
    this.onTap,
    this.rightArrow = true,
  });

  final Widget leftIcon;
  final String text;
  final VoidCallback? onTap;
  final bool rightArrow;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 20),
        child: Row(
          children: [
            leftIcon,
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            rightArrow
                ? SvgPicture.asset(ProfileIcons.arrow)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
