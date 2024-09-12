class TaskModel {
  String title;
  String subTitle;
  bool finished;

  TaskModel(
      {required this.title, required this.subTitle, this.finished = false});
}
