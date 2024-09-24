import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/core/widgets/action_container.dart';
import 'package:to_do_app/features/add_todo/presentation/views/select_date_dialog/month_calendar.dart';
import 'package:to_do_app/features/profile/presentation/views/widgets/custom_alert_dialog.dart';

class CalendarSelectionView extends StatelessWidget {
  const CalendarSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.greyBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      actionsPadding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MonthCalendar(
              initialDate: DateTime.now(),
              onDateSelected: (date) {
                GetIt.I.get<TaskModel>().dateTime = date;
              },
            ),
          ],
        ),
      ),
      actions: _dialogActions(context),
    );
  }

  List<Widget> _dialogActions(BuildContext context) {
    return [
      ActionContainer(
        text: "Cancel",
        foregroundColor: AppColors.purplePrimaryColor,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      const SizedBox(width: 5),
      ActionContainer(
        text: "Choose Time",
        backgroundColor: AppColors.purplePrimaryColor,
        onTap: () {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => const CustomAlertDialog(
              title: "Choose Time",
              content: SizedBox(),
              editButtonText: "Save",
            ),
          );
        },
      ),
    ];
  }
}
