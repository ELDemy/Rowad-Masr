import 'package:to_do_app/data/models/task_model/task_model.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';

abstract class LocalDataSource {
  void addTask(TaskModel taskModel);

  List<TaskModel> getTasksByDate(DateParam date);

  void deleteTask(TaskModel taskModel);

  void updateTask(TaskModel taskModel);
}
