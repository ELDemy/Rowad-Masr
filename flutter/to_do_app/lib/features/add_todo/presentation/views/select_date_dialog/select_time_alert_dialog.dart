import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/widgets/custom_alert_dialog.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_date_dialog/wheel_time_picker.dart';

class SelectTimeAlertDialog extends StatelessWidget {
  const SelectTimeAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Choose Time",
      content: Padding(
        padding: const EdgeInsets.only(bottom: 21.0),
        child: WheelTimePicker(
          onTimeSelected: (time) {
            GetIt.I.get<TaskModel>().dateTime = GetIt.I
                .get<TaskModel>()
                .dateTime
                .copyWith(hour: time.hour, minute: time.minute);
          },
        ),
      ),
      editButtonText: "Save",
      onEdit: () {
        Navigator.pop(context);
      },
    );
  }
}
