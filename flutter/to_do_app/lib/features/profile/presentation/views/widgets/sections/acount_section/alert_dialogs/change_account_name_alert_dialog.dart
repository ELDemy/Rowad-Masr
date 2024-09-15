import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/dialog_text_form_field.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/user_top_info_widget.dart';

class ChangeNameAlertDialog extends StatefulWidget {
  const ChangeNameAlertDialog({super.key});

  @override
  State<ChangeNameAlertDialog> createState() => _ChangeNameAlertDialogState();
}

class _ChangeNameAlertDialogState extends State<ChangeNameAlertDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Change account name",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogTextFormField(
              controller: _controller, labelText: UserTopInfo.name),
          const SizedBox(height: 28),
        ],
      ),
      onEdit: () {
        if (_controller.text.trim().isNotEmpty) {
          UserTopInfo.name = _controller.text;
        }
        Navigator.pop(context);
      },
    );
  }
}
