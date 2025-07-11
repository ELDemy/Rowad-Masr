import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/state_management/tasks_cubit/tasks_cubit.dart';

import 'widgets/calendar/horizontal_calendar.dart';
import 'widgets/tasks_filter/tasks_filter.dart';
import 'widgets/tasks_list/tasks_list.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TasksCubit>(context).showTasks();
  }

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
