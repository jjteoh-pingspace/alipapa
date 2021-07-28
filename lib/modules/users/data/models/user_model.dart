import 'package:alipapa/modules/users/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel(
      {required String username,
      required String email,
      required String password,
      required UserType userType})
      : super(
            username: username,
            email: email,
            password: password,
            userType: userType);

  factory UserModel.fromJson(Map<String, dynamic> json) { 
    return UserModel(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        userType: json['userType'] == 'merchant' ? UserType.merchant : UserType.customer);
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'userType': userType.value()
    };
  }
}
