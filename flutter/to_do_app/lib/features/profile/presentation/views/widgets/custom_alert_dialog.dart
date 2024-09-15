import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onEdit,
    this.alignmentGeometry,
    this.withActions = true,
  });

  final String title;
  final Widget content;
  final VoidCallback? onEdit;
  final AlignmentGeometry? alignmentGeometry;
  final bool withActions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: alignmentGeometry,
      backgroundColor: AppColors.kGreyBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.only(right: 8, left: 8, bottom: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      actionsPadding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      title: _DialogTitle(),
      content: content,
      actions: withActions ? _DialogActions(context) : null,
    );
  }

  Container _DialogTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xff979797)))),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  List<Widget> _DialogActions(BuildContext context) {
    return [
      _ActionContainer(
        text: "Cancel",
        foregroundColor: AppColors.kPrimaryColor,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      const SizedBox(width: 5),
      _ActionContainer(
        text: "Edit",
        backgroundColor: AppColors.kPrimaryColor,
        onTap: onEdit,
      ),
    ];
  }
}

class _ActionContainer extends StatelessWidget {
  const _ActionContainer({
    required this.text,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.onTap,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        width: 154,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
