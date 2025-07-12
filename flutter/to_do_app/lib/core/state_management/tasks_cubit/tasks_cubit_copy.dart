import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/error_handler/failure.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/use_cases/task_use_cases/update_task_use_case.dart';
import 'package:to_do_app/domain/use_cases/task_use_cases/delete_task_use_case.dart';
import 'package:to_do_app/domain/use_cases/task_use_cases/get_tasks_use_case.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';
import 'package:to_do_app/domain/use_cases/task_use_cases/tasks_use_cases.dart';

import 'tasks_cubit.dart';

class TasksCubit2 extends Cubit<TasksState> {
  TasksCubit2(
    this.getTasksByDataUseCase,
    this.addTaskUseCase,
    this.deleteTaskUseCase,
    this.updateTaskUseCase,
  ) : super(TasksInitial());

  final GetTasksByDataUseCase getTasksByDataUseCase;
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  late List<TaskEntity> _selectedDateTasksList;
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

  void showTasks() async {
    final Either<Failure, List<TaskEntity>> response =
        await getTasksByDataUseCase.call(DateParam(_dateTime));

    response.fold(
      (l) {
        return emit(ErrorTasks(l.errMsg));
      },
      (r) {
        _selectedDateTasksList = r;
        _tasksViewType ? getCompletedTasks() : getUncompletedTasks();
      },
    );
    return;
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

  void _listCheck(List<TaskEntity> tasksList) {
    final List<TaskModel> tasks =
        tasksList.map((e) => TaskModel.fromEntity(e)).toList();
    tasksList.isEmpty ? emit(EmptyTasks()) : emit(ShowTasks(tasks));
  }

  Future<void> addTask(TaskEntity task) async {
    await addTaskUseCase.call(task);

    showTasks();
  }

  Future<void> removeTask(TaskEntity task) async {
    await deleteTaskUseCase.call(task);

    showTasks();
  }

  Future<void> completeOrUncompleteTask(TaskEntity task) async {
    task.isCompleted = !task.isCompleted;
    await updateTaskUseCase(task);

    showTasks();
  }
}
