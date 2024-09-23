import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

class MonthCalendar extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime)? onDateSelected;

  const MonthCalendar({
    super.key,
    required this.initialDate,
    this.onDateSelected,
  });

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late DateTime currentDate;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    currentDate = widget.initialDate;
    selectedDate = widget.initialDate;
  }

  List<Widget> _buildDaysOfWeek() {
    return ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
        .map(
          (day) => Flexible(
            child: Container(
              width: 27,
              // padding: const EdgeInsets.only(top: 8),
              alignment: Alignment.center,
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 10,
                  height: 15.05 / 10,
                  fontWeight: FontWeight.w700,
                  color:
                      day == 'SUN' || day == 'SAT' ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildDayTiles(DateTime month) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final daysBefore = firstDayOfMonth.weekday % 7;

    final previousMonth = DateTime(month.year, month.month - 1);
    final daysInPreviousMonth =
        DateUtils.getDaysInMonth(previousMonth.year, previousMonth.month);

    // Total slots (to complete the grid)
    final totalSlots = (daysBefore + daysInMonth + 6) ~/ 7 * 7;

    return List.generate(totalSlots, (index) {
      final dayIndex = index - daysBefore + 1;

      // Show days from the previous month
      if (index < daysBefore) {
        final previousMonthDay = daysInPreviousMonth - daysBefore + index + 1;
        final day =
            DateTime(previousMonth.year, previousMonth.month, previousMonthDay);
        return _buildDayTile(day, isOutOfMonth: true);
      }

      // Show days from the current month
      if (dayIndex <= daysInMonth) {
        final day = DateTime(month.year, month.month, dayIndex);
        return _buildDayTile(day);
      }

      // Show days from the next month
      final nextMonthDay = dayIndex - daysInMonth;
      final nextMonth = DateTime(month.year, month.month + 1);
      final day = DateTime(nextMonth.year, nextMonth.month, nextMonthDay);
      return _buildDayTile(day, isOutOfMonth: true);
    });
  }

  Widget _buildDayTile(DateTime day, {bool isOutOfMonth = false}) {
    final isSelected = day.isSameDate(selectedDate);

    return GestureDetector(
      onTap: () {
        isOutOfMonth
            ? null
            : setState(
                () {
                  selectedDate = day;
                  if (widget.onDateSelected != null) {
                    widget.onDateSelected!(day);
                  }
                },
              );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.purplePrimaryColor
              : isOutOfMonth
                  ? Colors.transparent
                  : AppColors.darkGreyColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: isOutOfMonth ? AppColors.lightWhite : Colors.white,
            fontSize: 12,
            height: 18.06 / 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month and navigation controls
        _monthController(),
        const Divider(color: AppColors.greyOutline, height: 20),
        // Days of the week
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildDaysOfWeek()),
        ),
        // Day tiles
        GridView.count(
          shrinkWrap: true, // Important to avoid unbounded height
          crossAxisCount: 7,
          childAspectRatio: 1,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          mainAxisSpacing: 10,
          crossAxisSpacing: 23,
          children: _buildDayTiles(currentDate),
        ),
      ],
    );
  }

  Padding _monthController() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() {
              currentDate = DateTime(currentDate.year, currentDate.month - 1);
            }),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.arrow_back_ios_new,
                  size: 16, color: AppColors.whiteWithOpacity),
            ),
          ),
          Column(
            children: [
              Text(
                DateFormat('MMMM').format(currentDate).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 21.07 / 14,
                ),
              ),
              Text(
                DateFormat('yyyy').format(currentDate).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 15.05 / 10,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => setState(() {
              currentDate = DateTime(currentDate.year, currentDate.month + 1);
            }),
            child: Transform.flip(
              flipX: true,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_back_ios_new,
                    size: 16, color: AppColors.whiteWithOpacity),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
