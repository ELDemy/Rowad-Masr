import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/utiles/icons.dart';

class EditTaskAppBar extends StatelessWidget {
  const EditTaskAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11, bottom: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionContainer(
            child: const Icon(Icons.close_rounded),
            onTap: () => Navigator.pop(context),
          ),
          _actionContainer(
            child: SvgPicture.asset(TaskIcons.repeat),
          )
        ],
      ),
    );
  }

  GestureDetector _actionContainer(
      {required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xff1D1D1D),
            borderRadius: BorderRadius.circular(4),
          ),
          child: child),
    );
  }
}
