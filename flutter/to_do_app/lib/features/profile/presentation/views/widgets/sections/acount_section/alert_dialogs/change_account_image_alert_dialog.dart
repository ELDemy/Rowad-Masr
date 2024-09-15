import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/user_top_info_widget.dart';

class ChangeImageAlertDialog extends StatefulWidget {
  const ChangeImageAlertDialog({super.key});

  @override
  State<ChangeImageAlertDialog> createState() => _ChangeImageAlertDialogState();
}

class _ChangeImageAlertDialogState extends State<ChangeImageAlertDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      alignmentGeometry: Alignment.bottomCenter,
      withActions: false,
      title: "Change account name",
      content: const SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Take Picture"),
            Text("Import from gallery"),
            Text("Import from Google Drive"),
            SizedBox(height: 28),
          ],
        ),
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
