import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// Failure on calling to remote server
class ServerFailure extends Failure {}

