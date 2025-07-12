import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error_handler/failure.dart';
import 'package:to_do_app/domain/entities/task_entity.dart';
import 'package:to_do_app/domain/repositories/tasks_repository.dart';
import 'package:to_do_app/domain/use_cases/use_case.dart';

class UpdateTaskUseCase implements UseCase<void, TaskEntity> {
  final TasksRepository tasksRepository;
  UpdateTaskUseCase(this.tasksRepository);

  @override
  Future<Either<Failure, void>> call(TaskEntity taskEntity) async {
    return tasksRepository.updateTask(taskEntity);
  }
}
