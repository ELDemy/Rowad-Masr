import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<TaskModel> tasksList = [];

  void getTasksList() {
    tasksList == [] ? emit(EmptyTasks()) : emit(ShowTasks(tasksList));
  }

  addTask(TaskModel taskModel) {
    tasksList.add(taskModel);
    emit(ShowTasks(tasksList));
  }
}
