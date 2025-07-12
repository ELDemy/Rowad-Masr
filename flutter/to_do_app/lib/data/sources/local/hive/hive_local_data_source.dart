import 'package:hive/hive.dart';
import 'package:to_do_app/core/utiles/constants.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';
import 'package:to_do_app/data/sources/local/local_data_source.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

class HiveLocalDataSource implements LocalDataSource {
  Box<TaskModel> get _tasksBox => Hive.box<TaskModel>(AppConsts.tasksBox);

  @override
  void addTask(TaskModel taskModel) {
    _tasksBox.add(taskModel);
  }

  @override
  List<TaskModel> getTasksByDate(DateParam date) {
    return _tasksBox.values
        .where((task) => task.dateTime.isSameDate(date.date))
        .toList();
  }

  @override
  void deleteTask(TaskModel taskModel) {
    _tasksBox.delete(taskModel);
  }

  @override
  void updateTask(TaskModel taskModel) {
    _tasksBox.put(taskModel.key, taskModel);
  }
}
