import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error_handler/failure.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/tasks_repository.dart';
import 'package:to_do_app/domain/use_cases/use_case.dart';

import '../params/data_param.dart';

class GetTasksByDataUseCase implements UseCase<List<TaskEntity>, DateParam> {
  final TasksRepository tasksRepository;
  GetTasksByDataUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(DateParam date) async {
    return tasksRepository.getTasksByDate(date);
  }
}
