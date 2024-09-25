import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utiles/constants.dart';
import 'package:to_do_app/helper/datetime_extension.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  Box<TaskModel> get _tasksBox => Hive.box<TaskModel>(AppConsts.tasksBox);
  late List<TaskModel> _selectedDateTasksList;
  DateTime _dateTime = DateTime.now();

  set dateTime(DateTime dateTime) {
    _dateTime = dateTime;
    showTasks();
  }

  // false to show today tasks
  // true to show completed tasks
  bool _tasksViewType = false;

  set tasksViewType(bool viewType) {
    _tasksViewType = viewType;
    showTasks();
  }

  void showTasks() {
    _selectedDateTasksList = _tasksBox.values
            .where((task) => task.dateTime.isSameDate(_dateTime))
            .toList()
        // ..sort(
        //   (a, b) => a.dateTime.compareTo(b.dateTime),
        // )
        ;

    _tasksViewType ? getCompletedTasks() : getUncompletedTasks();
  }

  getCompletedTasks() {
    _listCheck(
      _selectedDateTasksList.where((task) => task.isCompleted).toList(),
    );
  }

  getUncompletedTasks() {
    _listCheck(
      _selectedDateTasksList.where((task) => !task.isCompleted).toList(),
    );
  }

  void _listCheck(List<TaskModel> tasksList) {
    tasksList.isEmpty ? emit(EmptyTasks()) : emit(ShowTasks(tasksList));
  }

  addTask(TaskModel taskModel) {
    _tasksBox.add(taskModel);
    showTasks();
  }

  removeTask(TaskModel taskModel) {
    _tasksBox.delete(taskModel);
    showTasks();
  }

  completeTask(TaskModel taskModel) {
    taskModel.isCompleted = !taskModel.isCompleted;
    taskModel.save();
    showTasks();
  }
}
