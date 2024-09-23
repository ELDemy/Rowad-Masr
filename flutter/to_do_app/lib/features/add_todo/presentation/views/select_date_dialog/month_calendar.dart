import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthCalendar extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime)? onDateSelected;

  const MonthCalendar(
      {Key? key, required this.initialDate, this.onDateSelected})
      : super(key: key);

  @override
  _MonthCalendarState createState() => _MonthCalendarState();
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
        .map((day) => Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: day == 'SUN' || day == 'SAT'
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ),
            ))
        .toList();
  }

  List<Widget> _buildDayTiles(DateTime month) {
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final daysBefore = firstDayOfMonth.weekday % 7;
    final totalSlots = (daysBefore + daysInMonth + 6) ~/ 7 * 7;

    return List.generate(totalSlots, (index) {
      final dayIndex = index - daysBefore + 1;
      final day = DateTime(month.year, month.month, dayIndex);

      if (index < daysBefore || dayIndex > daysInMonth) {
        return Container(); // Return an empty box for empty days
      }

      final isToday = day.isAtSameMomentAs(DateTime.now());
      final isSelected = day.isAtSameMomentAs(selectedDate);
      final isWeekend = day.weekday == 7 || day.weekday == 6;

      return GestureDetector(
        onTap: () => setState(() {
          selectedDate = day;
          if (widget.onDateSelected != null) widget.onDateSelected!(day);
        }),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue
                : isToday
                    ? Colors.grey[800]
                    : Colors.grey[900],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            '${day.day}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Month and navigation controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () => setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month - 1);
              }),
            ),
            Text(
              DateFormat('MMMM yyyy').format(currentDate).toUpperCase(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () => setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month + 1);
              }),
            ),
          ],
        ),
        Divider(color: Colors.grey[700]),
        // Days of the week
        Row(children: _buildDaysOfWeek()),
        // Day tiles
        GridView.count(
          shrinkWrap: true, // Important to avoid unbounded height
          crossAxisCount: 7,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _buildDayTiles(currentDate),
        ),
      ],
    );
  }
}
