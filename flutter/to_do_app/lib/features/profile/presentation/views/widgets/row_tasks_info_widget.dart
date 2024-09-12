import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/colors.dart';

class TasksInfoWidget extends StatelessWidget {
  const TasksInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ContainerInfo("10 Tasks left"),
        SizedBox(width: 20),
        _ContainerInfo("5 Tasks done"),
      ],
    );
  }
}

class _ContainerInfo extends StatelessWidget {
  const _ContainerInfo(this.text);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17),
      width: 158,
      decoration: BoxDecoration(
        color: AppColors.kGreyBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
