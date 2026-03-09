import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/categories_table.dart';
import '../tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [Tasks, Categories])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Future<List<Task>> getAllTasks() async {
    return await select(tasks).get();
  }

  // Get tasks with their categories using join
  Future<List<TaskWithCategory>> getTasksWithCategories() async {
    final query = select(tasks).join([
      leftOuterJoin(categories, categories.id.equalsExp(tasks.categoryId)),
    ]);

    return await query.map((row) {
      return TaskWithCategory(
        task: row.readTable(tasks),
        category: row.readTableOrNull(categories),
      );
    }).get();
  }

  Future<List<TaskWithCategory>> getTasksByDateWithCategory(
      DateTime date) async {
    final query = select(tasks).join([
      leftOuterJoin(categories, categories.id.equalsExp(tasks.categoryId)),
    ])
      ..where(tasks.dueDate.equals(date));

    return await query.map((row) {
      return TaskWithCategory(
        task: row.readTable(tasks),
        category: row.readTableOrNull(categories),
      );
    }).get();
  }

  Future<List<Task>> getTasksByDate(DateTime date) async {
    return await (select(tasks)..where((tbl) => tbl.dueDate.equals(date)))
        .get();
  }

  Future<int> insertTask(TasksCompanion entry) async {
    return await into(tasks).insert(entry);
  }

  Future<bool> updateTask(TasksCompanion entry) async {
    return await update(tasks).replace(entry);
  }

  Future<int> deleteTask(int id) async {
    return await (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteTaskByCompanion(TasksCompanion entry) async {
    return await (delete(tasks)..where((tbl) => tbl.id.equals(entry.id.value)))
        .go();
  }
}

class TaskWithCategory {
  final Task task;
  final Category? category;

  TaskWithCategory({required this.task, this.category});
}
