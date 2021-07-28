import 'dart:io';

import 'package:alipapa/modules/users/data/models/user_model.dart';

abstract class IUserRemoteDataSource {
  Future<UserModel> createUser(UserModel userModel);
}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final HttpClient httpClient;

  UserRemoteDataSource({ required this.httpClient});

  @override
  Future<UserModel> createUser(UserModel userModel) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
}
