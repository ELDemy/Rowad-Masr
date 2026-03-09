import 'package:drift/drift.dart';
import 'categories_table.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get priority => integer().withDefault(const Constant(1))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}
