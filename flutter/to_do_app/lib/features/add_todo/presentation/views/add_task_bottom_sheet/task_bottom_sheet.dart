import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/features/add_todo/data/get_it_add_task.dart';

import 'widgets/add_task_actions.dart';
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
