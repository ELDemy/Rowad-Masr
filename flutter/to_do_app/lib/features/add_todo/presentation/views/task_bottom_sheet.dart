import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/features/add_todo/presentation/views/bottom_sheet_text_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25,
        left: 25,
        right: 17,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(height: 14),
          BottomSheetTextFormField(
            controller: _titleController,
            hintText: "Title",
          ),
          BottomSheetTextFormField(
            controller: _descriptionController,
            hintText: "Description",
          ),
          const SizedBox(height: 19),
          _taskActions(),
        ],
      ),
    );
  }

  Text _title() {
    return const Text(
      "Add Task",
      style: TextStyle(
        fontSize: 20,
        height: 30.1 / 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _taskActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _taskPropsActions(),
        _submitTaskAction(),
      ],
    );
  }

  IconButton _submitTaskAction() {
    return IconButton(
      onPressed: () {
        final TaskModel taskModel = TaskModel(
          title: _titleController.text,
          description: _descriptionController.text,
          dateTime: DateTime.now(),
          category: CategoryModel(
            category: "category",
            color: const Color(0xffFFCC80),
            icon: Icons.work_outline_rounded,
          ),
        );
        BlocProvider.of<TasksCubit>(context).addTask(taskModel);
        Navigator.pop(context);
        // NavBarData.controller.jumpToTab(1);
      },
      icon: const Icon(
        Icons.send,
        color: AppColors.purplePrimaryColor,
      ),
    );
  }

  Widget _taskPropsActions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          IconButton(
            padding: const EdgeInsets.only(right: 32),
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: const Icon(Icons.timer_outlined),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 32),
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: const Icon(Icons.timer_outlined),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 32),
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: const Icon(Icons.timer_outlined),
          ),
        ],
      ),
    );
  }
}
