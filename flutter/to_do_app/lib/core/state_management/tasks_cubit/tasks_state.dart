part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class EmptyTasks extends TasksState {}

final class ShowTasks extends TasksState {
  final List<TaskModel> tasksList;

  ShowTasks(this.tasksList);
}
