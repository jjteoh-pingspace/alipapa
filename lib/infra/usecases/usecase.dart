
import 'package:alipapa/infra/error/failures.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> execute(Params params);
}

