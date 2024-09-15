import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/dialog_text_form_field.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/user_top_info_widget.dart';

class ChangePasswordAlertDialog extends StatefulWidget {
  const ChangePasswordAlertDialog({super.key});

  @override
  State<ChangePasswordAlertDialog> createState() =>
      _ChangePasswordAlertDialogState();
}

class _ChangePasswordAlertDialogState extends State<ChangePasswordAlertDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Change account name",
      content: DialogTextFormField(
          controller: _nameController, labelText: UserTopInfo.name),
      onEdit: () {
        if (_nameController.text.trim().isNotEmpty) {
          UserTopInfo.name = _nameController.text;
        }
        Navigator.pop(context);
      },
    );
  }
}
