import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_category_dialog/select_category_dialog.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_date_dialog/select_date_dialog.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_priority_dialog/select_priority_dialog.dart';

class AddTaskActions extends StatelessWidget {
  const AddTaskActions({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _taskPropsActions(context),
          _submitTaskAction(context),
        ],
      ),
    );
  }

  Widget _taskPropsActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const SelectDateDialog(),
              );
            },
            child: SvgPicture.asset(TaskIcons.timer),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const SelectCategoryDialog(),
              );
            },
            child: SvgPicture.asset(TaskIcons.tag),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const SelectPriorityDialog(),
              );
            },
            child: SvgPicture.asset(TaskIcons.flag),
          ),
        ],
      ),
    );
  }

  Widget _submitTaskAction(BuildContext context) {
    return InkWell(
      onTap: () {
        final TaskModel taskModel = GetIt.I.get<TaskModel>();
        taskModel.title = titleController.text;
        taskModel.description = descriptionController.text;
        BlocProvider.of<TasksCubit>(context).addTask(taskModel);
        Navigator.pop(context);
      },
      child: SvgPicture.asset(TaskIcons.send),
    );
  }
}
