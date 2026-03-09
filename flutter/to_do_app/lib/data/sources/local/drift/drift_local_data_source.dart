// data_sources/drift_local_data_source.dart
import 'package:to_do_app/data/database/local/dao/task_dao.dart';
import 'package:to_do_app/data/database/local/dao/category_dao.dart';
import 'package:to_do_app/data/database/local/mappers/mapper.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';
import '../local_data_source.dart';

class DriftLocalDataSource implements LocalDataSource {
  final TaskDao taskDao;
  final CategoryDao categoryDao;

  DriftLocalDataSource({
    required this.taskDao,
    required this.categoryDao,
  });

  @override
  Future<void> addTask(TaskModel taskModel) async {
    await taskDao.insertTask(toTaskCompanion(taskModel));
  }

  @override
  Future<void> deleteTask(TaskModel taskModel) async {
    if (taskModel.id != null) {
      await taskDao.deleteTask(taskModel.id!);
    }
  }

  @override
  Future<List<TaskModel>> getTasksByDate(DateParam date) async {
    final tasksWithCategories =
        await taskDao.getTasksByDateWithCategory(date.date);
    return tasksWithCategories.map((e) => fromTaskWithCategory(e)).toList();
  }

  @override
  Future<void> updateTask(TaskModel taskModel) async {
    await taskDao.updateTask(toTaskCompanionWithId(taskModel));
  }

  Future<List<TaskModel>> getAllTasks() async {
    final tasksWithCategories = await taskDao.getTasksWithCategories();
    return tasksWithCategories.map((e) => fromTaskWithCategory(e)).toList();
  }

  // Category operations

  Future<void> addCategory(CategoryModel categoryModel) async {
    await categoryDao.insertCategory(toCategoryCompanion(categoryModel));
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final categories = await categoryDao.getAllCategories();
    return categories.map((e) => fromCategoryData(e)).toList();
  }

  @override
  Future<CategoryModel> getCategoryById(int id) async {
    final category = await categoryDao.getCategoryById(id);
    return fromCategoryData(category);
  }
}
