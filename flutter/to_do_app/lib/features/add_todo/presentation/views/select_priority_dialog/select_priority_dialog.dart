import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/custom_alert_dialog.dart';

class SelectPriorityDialog extends StatelessWidget {
  const SelectPriorityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAlertDialog(
      title: "Task Priority",
      content: SizedBox(),
    );
  }
}
