import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/features/add_todo/presentation/views/bottom_sheet_text_field.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_date_dialog/calendar_selection_view.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime taskDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25,
        left: 25,
        right: 17,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            const SizedBox(height: 14),
            BottomSheetTextFormField(
              controller: _titleController,
              hintText: "Title",
              autofocus: true,
            ),
            BottomSheetTextFormField(
              controller: _descriptionController,
              hintText: "Description",
              maxLines: 15,
            ),
            const SizedBox(height: 19),
            _taskActions(),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _taskPropsActions(),
          _submitTaskAction(),
        ],
      ),
    );
  }

  Widget _submitTaskAction() {
    return InkWell(
      onTap: () {
        final TaskModel taskModel = TaskModel(
          title: _titleController.text,
          description: _descriptionController.text,
          dateTime: taskDate,
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
      child: SvgPicture.asset('assets/icons/task_props_icons/send.svg'),
    );
  }

  Widget _taskPropsActions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CalendarSelectionView();
                },
              );
              // showDatePicker(
              //   context: context,
              //   firstDate: DateTime(2000),
              //   lastDate: DateTime(2030),
              //   initialDate: taskDate,
              // ).then((date) {
              //   date != null ? taskDate = date : null;
              // });
            },
            child: SvgPicture.asset('assets/icons/task_props_icons/timer.svg'),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/task_props_icons/tag.svg'),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/task_props_icons/flag.svg'),
          ),
        ],
      ),
    );
  }
}
