import 'package:hive_flutter/hive_flutter.dart';

import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/core/error/exceptions.dart';
import 'package:movie_hub/features/authentication/data/model/user_model/user_model.dart';

abstract interface class AuthenticationData {
  Future<bool> userSignUp({
    required String userName,
    required String userPassword,
    required String userPhoneNumber,
    required String userEmail,
    required UserProffession proffession,
  });
  Future<bool> userLogIn({
    required String userName,
    required String userPassword,
  });
}

class AuthenticationDataImpl implements AuthenticationData {
  final Box<UserModel?> userBox;
  AuthenticationDataImpl({
    required this.userBox,
  });
  @override
  Future<bool> userLogIn({
    required String userName,
    required String userPassword,
  }) async {
    try {
      final userExists = userBox.values.any((user) =>
          user?.userName == userName && user?.userPassword == userPassword);
      return userExists;
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<bool> userSignUp({
    required String userName,
    required String userPassword,
    required String userPhoneNumber,
    required String userEmail,
    required UserProffession proffession,
  }) async {
    try {
      // Check for existing user by email
      final existingUserByEmail = userBox.values.firstWhere(
        (user) => user?.useremail == userEmail,
        orElse: () => UserModel(
          useremail: '',
          userPhoneNumber: '',
          username: '',
          userpassword: '',
          userProffession: UserProffession.other.name,
        ),
      );
       // Check for existing user by euserName
      final existingUserByUsername = userBox.values.firstWhere(
        (user) => user?.username == userName,
        orElse: () => UserModel(
          useremail: '',
          userPhoneNumber: '',
          username: '',
          userpassword: '',
          userProffession: UserProffession.other.name,
        ),
      );

      if (existingUserByEmail!.useremail!.isNotEmpty) {
        throw DatabaseException(message: 'Email already exists');
      }

      if (existingUserByUsername!.username!.isNotEmpty) {
        throw DatabaseException(message: 'Username already exists');
      }

      final userModel = UserModel(
        useremail: userEmail,
        userPhoneNumber: '+91$userPhoneNumber',
        username: userName,
        userpassword: userPassword,
        userProffession: proffession.name,
      );
      final addedUserId = await userBox.add(userModel);
      final updatedUserModel = userModel.copyWith(
        userid: addedUserId,
      );
      userBox.put(addedUserId, updatedUserModel);
      return true;
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }
}
