import 'package:alipapa/infra/error/exceptions.dart';
import 'package:alipapa/infra/error/failures.dart';
import 'package:alipapa/infra/network/network_info.dart';
import 'package:alipapa/modules/users/data/data_sources/user_remote_data_source.dart';
import 'package:alipapa/modules/users/data/models/user_model.dart';
import 'package:alipapa/modules/users/data/repositories/user_repository.dart';
import 'package:alipapa/modules/users/domain/entities/user.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkInfo extends Mock implements INetworkInfo {}

class MockUserRemoteDataSource extends Mock implements IUserRemoteDataSource {}

void main() {
  group('user repository', () {
    late MockUserRemoteDataSource mockUserRemoteDataSource;
    late UserRepository userRepository;
    late MockNetworkInfo mockNetworkInfo;

    setUp(() {
      mockUserRemoteDataSource = MockUserRemoteDataSource();
      userRepository = UserRepository();
      mockNetworkInfo = MockNetworkInfo();
    });

    group('register user', () {
      final tUserModel = UserModel(
          username: 'testUser1',
          email: 'testUser1@mail.com',
          password: 'abc123',
          userType: UserType.customer);

      group('when online', () {
        test(
            'should return usermodel when post user registration to remote data source successfully',
            () async {
          // arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockUserRemoteDataSource.createUser(tUserModel))
              .thenAnswer((_) async => tUserModel);

          // act
          final result = await userRepository.registerUser(tUserModel);

          // assert
          verify(() => mockNetworkInfo.isConnected);
          verify(() => mockUserRemoteDataSource.createUser(tUserModel));
          expect(result, equals(Right(tUserModel)));
        });

        test(
            'should throw server failure when post user registration to remote data source is unsuccessful',
            () async {
          // arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockUserRemoteDataSource.createUser(tUserModel))
              .thenThrow(ServerException());

          // act
          final result = await userRepository.registerUser(tUserModel);

          // assert
          verify(() => mockUserRemoteDataSource.createUser(tUserModel));
          expect(result, equals(Left(ServerFailure())));
        });
      });

      group('when offline', () {});
    });
  });
}
