import 'dart:convert';

import 'package:alipapa/modules/users/data/models/user_model.dart';
import 'package:alipapa/modules/users/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final customerUserModel = UserModel(
      username: 'johndoe',
      email: 'johndoe@email.com',
      password: 'abc123',
      userType: UserType.customer);

  final merchantUserModel = UserModel(
      username: 'aliceKey',
      email: 'aliceKey@email.com',
      password: 'abc123',
      userType: UserType.merchant);

  test('should be a subclass of UserEntity', () async {
    // assert
    expect(customerUserModel, isA<User>());
    expect(merchantUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid customer model from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('customer_user.json'));

      // act
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result, customerUserModel);
    });

    test('should return a valid merchant model from json', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('merchant_user.json'));

      // act
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result, merchantUserModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing data from customer model',
        () async {
      // act
      final result = customerUserModel.toJson();
      // assert
      final expectedMap = {
        "username": "johndoe",
        "email": "johndoe@email.com",
        "password": "abc123",
        "userType": "customer"
      };
      expect(result, expectedMap);
    });

    test('should return a JSON map containing data from merchant model',
        () async {
      // act
      final result = merchantUserModel.toJson();
      // assert
      final expectedMap = {
        "username": "aliceKey",
        "email": "aliceKey@email.com",
        "password": "abc123",
        "userType": "merchant"
      };
      expect(result, expectedMap);
    });
  });
}
