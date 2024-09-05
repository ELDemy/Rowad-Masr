import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Title"),
              initialValue: task.title,
            ),
            const SizedBox(height: 32),
            TextFormField(
              decoration: const InputDecoration(hintText: "Details"),
              initialValue: task.subTitle,
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Button(context, "Update"),
                _Button(context, "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _Button(context, String text) {
    return CustomElevatedButton(
      width: MediaQuery.of(context).size.width * .4,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
