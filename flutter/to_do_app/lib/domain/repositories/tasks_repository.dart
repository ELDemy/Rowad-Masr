import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error_handler/failure.dart';

import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/use_cases/params/data_param.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasksByDate(DateParam data);

  Future<Either<Failure, void>> addTask(TaskEntity taskEntity);
  Future<Either<Failure, void>> deleteTask(TaskEntity taskEntity);
  Future<Either<Failure, void>> updateTask(TaskEntity taskEntity);
}
