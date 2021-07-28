import 'package:alipapa/modules/users/data/models/user_model.dart';
import 'package:alipapa/modules/users/domain/entities/user.dart';
import 'package:alipapa/infra/error/failures.dart';
import 'package:alipapa/modules/users/domain/repository_contracts/user_repository_contract.dart';
import 'package:either_dart/src/either.dart';

class UserRepository implements IUserRepository {
  @override
  Future<Either<Failure, User>> registerUser(UserModel userModel) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
