import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/error_handler/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call(Param param);
}

class NoParam {
  const NoParam();
}
