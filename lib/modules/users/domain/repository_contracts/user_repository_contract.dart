import 'package:alipapa/infra/error/failures.dart';
import 'package:alipapa/modules/users/data/models/user_model.dart';
import 'package:alipapa/modules/users/domain/entities/user.dart';
import 'package:either_dart/either.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>>registerUser(UserModel userModel);
}
