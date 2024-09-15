import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/dialog_text_form_field.dart';

class ChangePasswordAlertDialog extends StatefulWidget {
  const ChangePasswordAlertDialog({super.key});

  @override
  State<ChangePasswordAlertDialog> createState() =>
      _ChangePasswordAlertDialogState();
}

class _ChangePasswordAlertDialogState extends State<ChangePasswordAlertDialog> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Change account Password",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Enter old password"),
          const SizedBox(height: 8),
          DialogTextFormField(
              controller: _oldPasswordController, obscureText: true),
          const SizedBox(height: 10),
          const Text("Enter new password"),
          const SizedBox(height: 8),
          DialogTextFormField(
              controller: _newPasswordController, obscureText: true),
          const SizedBox(height: 37)
        ],
      ),
      onEdit: () {},
    );
  }
}
