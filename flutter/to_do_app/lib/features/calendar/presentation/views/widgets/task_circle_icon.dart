import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class TaskCircleIcon extends StatefulWidget {
  const TaskCircleIcon({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskCircleIcon> createState() => _TaskCircleIconState();
}

class _TaskCircleIconState extends State<TaskCircleIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: widget.taskModel.isCompleted,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        setState(() {
          BlocProvider.of<TasksCubit>(context).completeTask(widget.taskModel);
        });
      },
      color: Colors.white.withOpacity(.87),
      // iconSize: 16,
      icon: const Icon(
        Icons.circle_outlined,
      ),
      selectedIcon: const Icon(
        Icons.circle,
        color: AppColors.purplePrimaryColor,
      ),
    );
  }
}
