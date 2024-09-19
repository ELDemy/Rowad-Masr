import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class ChangeImageAlertDialog extends StatelessWidget {
  const ChangeImageAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors.greyBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      titlePadding: const EdgeInsets.only(right: 32, left: 32, bottom: 17),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: _alertTitle(),
      content: _alertContent(width),
    );
  }

  SizedBox _alertContent(double width) {
    return SizedBox(
      width: width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AlertImageOption(text: "Take picture"),
          _AlertImageOption(text: "Import from gallery"),
          _AlertImageOption(text: "Import from Google Drive"),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Container _alertTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff979797)))),
      alignment: Alignment.center,
      child: const Text(
        "Change account Image",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _AlertImageOption extends StatelessWidget {
  const _AlertImageOption({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap ?? () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
