import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/calendar/horizontal_week_calendar.dart';

class HorizontalWeek extends StatelessWidget {
  const HorizontalWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalWeekCalendar(
      minDate: DateTime(2020, 12, 31),
      maxDate: DateTime(2026, 9, 31),
      initialDate: DateTime.now(),
      onDateChange: (date) {
        print(date);
      },
      weekStartFrom: WeekStartFrom.Sunday,
      showNavigationButtons: true,
      monthStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(.87),
      ),
      yearStyle: const TextStyle(fontSize: 10, color: Color(0xffAFAFAF)),
      leftNavBarAction: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(Icons.arrow_back_ios_new,
            size: 16, color: AppColors.whiteWithOpacity),
      ),
      rightNavBarAction: Transform.flip(
        flipX: true,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(Icons.arrow_back_ios_new,
              size: 16, color: AppColors.whiteWithOpacity),
        ),
      ),
      borderRadius: BorderRadius.circular(4),
      activeBackgroundColor: AppColors.purplePrimaryColor,
      inactiveBackgroundColor: AppColors.darkGreyColor,
      disabledBackgroundColor: AppColors.darkGreyColor.withOpacity(.3),
      activeDateNameStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      activeDateNumberStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    );
  }
}
