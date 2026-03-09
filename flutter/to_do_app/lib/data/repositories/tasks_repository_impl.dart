import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error_handler/failure.dart';
import 'package:to_do_app/data/models/task_model/task_model.dart';

import 'package:to_do_app/data/sources/local/local_data_source.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/tasks_repository.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';

class TasksRepositoryImpl implements TasksRepository {
  final LocalDataSource localDataSource;
  TasksRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksByDate(
    DateParam date,
  ) async {
    try {
      List<TaskModel> tasks = await localDataSource.getTasksByDate(date);
      List<TaskEntity> tasksEntities = tasks.map((e) => e.toEntity()).toList();
      return Right(tasksEntities);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity taskEntity) async {
    try {
      localDataSource.addTask(TaskModel.fromEntity(taskEntity));

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(
    TaskEntity taskEntity,
  ) async {
    try {
      localDataSource.updateTask(TaskModel.fromEntity(taskEntity));

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(TaskEntity taskEntity) async {
    try {
      localDataSource.deleteTask(TaskModel.fromEntity(taskEntity));

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
