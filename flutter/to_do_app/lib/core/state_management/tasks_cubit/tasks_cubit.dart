import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  List<TaskModel> tasksList = [];

  // false to show today tasks
  // true to show completed tasks
  bool _tasksViewType = false;

  set tasksViewType(bool viewType) {
    _tasksViewType = viewType;
    showTasks();
  }

  void showTasks() {
    _tasksViewType ? getCompletedTasks() : getUncompletedTasks();
  }

  getCompletedTasks() {
    _listCheck(
      tasksList.where((task) => task.isCompleted).toList(),
    );
  }

  getUncompletedTasks() {
    _listCheck(
      tasksList.where((task) => !task.isCompleted).toList(),
    );
  }

  void _listCheck(List<TaskModel> tasksList) {
    tasksList.isEmpty ? emit(EmptyTasks()) : emit(ShowTasks(tasksList));
  }

  addTask(TaskModel taskModel) {
    tasksList.add(taskModel);
    showTasks();
  }

  removeTask(TaskModel taskModel) {
    tasksList.remove(taskModel);
    showTasks();
  }
}
