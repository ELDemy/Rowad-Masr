import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_app/core/utiles/icons.dart';
import 'package:to_do_app/features/add_todo/data/get_it_add_task.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_date_dialog/calendar_selection_view.dart';

import 'widgets/add_task_form_fields.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItTaskModel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    GetIt.I.unregister<TaskModel>();
    super.dispose();
  }

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            AddTaskFormFields(
              titleController: _titleController,
              descriptionController: _descriptionController,
            ),
            AddTaskActions(
              titleController: _titleController,
              descriptionController: _descriptionController,
            ),
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
}

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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const CalendarSelectionView(),
              );
            },
            child: SvgPicture.asset(TaskIcons.timer),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(TaskIcons.tag),
          ),
          const SizedBox(width: 32),
          InkWell(
            onTap: () {},
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
