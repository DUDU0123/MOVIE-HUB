import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/core/error/exceptions.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/authentication/data/data_source/auth_data/authentication_data.dart';
import 'package:movie_hub/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationData authenticationData;
  AuthenticationRepositoryImpl({
    required this.authenticationData,
  });

  @override
  Future<Either<Failure, bool>> userLogin(
      {required String userName, required String userPassword}) async {
    try {
      final isLoggedIn = await authenticationData.userLogIn(
          userName: userName, userPassword: userPassword);
      return right(isLoggedIn);
    } on DatabaseException catch (e) {
      log(name: "hshac", e.toString());
      return left(Failure(message: e.toString()));
    } catch (e) {
      log(name: "hshac",e.toString());
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> userSignUp(
      {required String userName,
      required String userPassword,
      required String userPhoneNumber,
      required String userEmail,
      required UserProffession proffession}) async {
    try {
      final isLoggedIn = await authenticationData.userSignUp(
          userName: userName,
          userPassword: userPassword,
          userPhoneNumber: userPhoneNumber,
          userEmail: userEmail,
          proffession: proffession);
      return right(isLoggedIn);
    } on DatabaseException catch (e) {
      log(name: "hshac",e.toString());
      return left(Failure(message: e.toString()));
    } catch (e) {
      log(name: "hshac",e.toString());
      return left(Failure(message: e.toString()));
    }
  }
}
