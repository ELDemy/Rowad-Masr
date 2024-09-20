import 'package:flutter/material.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/calendar/horizontal_calendar.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/tasks_filter/tasks_filter.dart';
import 'package:to_do_app/features/calendar/presentation/views/widgets/tasks_list/tasks_list.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HorizontalWeek(),
          TasksFilter(),
          TasksListView(),
        ],
      ),
    );
  }
}
