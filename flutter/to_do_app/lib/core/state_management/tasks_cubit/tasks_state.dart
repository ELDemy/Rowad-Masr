part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {
  const TasksState();
}

final class TasksInitial extends TasksState {}

final class ErrorTasks extends TasksState {
  final String errMsg;
  const ErrorTasks(this.errMsg);
}

final class EmptyTasks extends TasksState {}

final class ShowTasks extends TasksState {
  final List<TaskModel> tasksList;

  const ShowTasks(this.tasksList);
}
