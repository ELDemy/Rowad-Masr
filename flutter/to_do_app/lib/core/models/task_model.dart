class TaskModel {
  final String title;
  final String description;
  final DateTime dateTime;
  final String? category;
  final int priority;
  final List<TaskModel> subTasks = [];

  TaskModel({
    required this.title,
    required this.description,
    required this.dateTime,
    this.category,
    this.priority = 1,
  });

  void addSubTask(TaskModel taskModel) {
    subTasks.add(taskModel);
  }
}
