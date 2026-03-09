import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/categories_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<Category>> getAllCategories() async {
    return await select(categories).get();
  }

  Future<Category> getCategoryById(int id) async {
    return await (select(categories)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<int> insertCategory(CategoriesCompanion entry) async {
    return await into(categories).insert(entry);
  }

  Future<bool> updateCategory(CategoriesCompanion entry) async {
    return await update(categories).replace(entry);
  }

  Future<int> deleteCategory(int id) async {
    return await (delete(categories)..where((tbl) => tbl.id.equals(id))).go();
  }
}
