
// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';

enum UserType { customer, merchant }

class User extends Equatable {
  final String username;
  final String email;
  final String password;
  final UserType userType;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.userType
  });

  @override 
  List<Object> get props => [username, email, password, userType]
}
