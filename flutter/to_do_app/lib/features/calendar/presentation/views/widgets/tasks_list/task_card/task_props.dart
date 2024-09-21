import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class TaskProps extends StatelessWidget {
  const TaskProps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _taskCategory(),
        const SizedBox(width: 12),
        _priorityWidget(),
      ],
    );
  }

  Container _taskCategory() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xffFFCC80),
        ),
        child: Row(
          children: [
            Icon(
              Icons.work_outline_rounded,
              size: 14,
              color: Colors.black.withOpacity(.6),
            ),
            const SizedBox(width: 5),
            const Text(
              "Work",
              style: TextStyle(
                fontSize: 12,
                height: 21 / 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  Container _priorityWidget() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purplePrimaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Row(
          children: [
            Icon(Icons.flag_outlined, size: 14),
            SizedBox(width: 5),
            Text(
              "1",
              style: TextStyle(fontSize: 12, height: 21 / 12),
            )
          ],
        ),
      );
}
