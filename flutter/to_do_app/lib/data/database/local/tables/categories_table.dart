import 'package:drift/drift.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
  IntColumn get colorValue => integer()();
  IntColumn get iconCode => integer()();
}
