import 'package:intl/intl.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';

extension CompareDates on DateTime {
  bool isSameDate(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}

String formatTime(TaskModel taskModel) {
  if (taskModel.dateTime.isSameDate(DateTime.now())) {
    return "Today At ${DateFormat("HH:mm").format(taskModel.dateTime)}";
  } else if (taskModel.dateTime.year == DateTime.now().year) {
    return DateFormat("MMM d At HH:mm").format(taskModel.dateTime);
  } else {
    return DateFormat("y MMM d").format(taskModel.dateTime);
  }
}
