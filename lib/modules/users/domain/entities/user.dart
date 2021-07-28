import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonValue("customer")
  customer,
  @JsonValue("merchant")
  merchant
}

extension UserTypeExt on UserType {
  String value() {
    return this.toString().split('.').last;
  }
}

class User extends Equatable {
  final String username;
  final String email;
  final String password;
  final UserType userType;

  User(
      {required this.username,
      required this.email,
      required this.password,
      required this.userType});

  @override
  List<Object> get props => [username, email, password, userType];
}
