import 'dart:developer';

import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/utils/message_show_helper.dart';
import 'package:movie_hub/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';

class AuthMethods {
  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&#]{8,}$');
  static void userLogin({
    required String? userName,
    required String password,
  }) {
    log("Username: $userName");
    if (userName == null) {
      MessageShowHelper.showSnackbar(
        context: navigatorKey.currentContext!,
        snackBarContent: 'Invalid credentials',
      );
    }
    if (userName != null) {
      if (userName.isNotEmpty && password.isNotEmpty) {
        final UserEntity userEntity = UserEntity(
          userName: userName,
          userPassword: password,
        );
        navigatorKey.currentContext!
            .read<AuthBloc>()
            .add(LogInEvent(userEntity: userEntity));
      }
    }
    if (!passwordRegExp.hasMatch(password) || userName!.isEmpty) {
      MessageShowHelper.showSnackbar(
        context: navigatorKey.currentContext!,
        snackBarContent: 'Invalid credentials',
      );
    }
  }

  static void userSignUp({
    required String? email,
    required String password,
    required String? userName,
    required String? phoneNumber,
    required UserProffession? userProffession,
  }) {
    log("Otside signup $email");
     if (email==null) {
      MessageShowHelper.showSnackbar(
        context: navigatorKey.currentContext!,
        snackBarContent: 'Entered email is not valid',
      );
    }
    if (!emailRegExp.hasMatch(email!)) {
      MessageShowHelper.showSnackbar(
        context: navigatorKey.currentContext!,
        snackBarContent: 'Entered email is not valid',
      );
    }
    if (!passwordRegExp.hasMatch(password)) {
      MessageShowHelper.showSnackbar(
        context: navigatorKey.currentContext!,
        snackBarContent:
            'Password must contain 1 uppercase, lowercase, special character and number',
      );
    }
    if (phoneNumber?.length != 10) {
      MessageShowHelper.showSnackbar(
          context: navigatorKey.currentContext!,
          snackBarContent: 'Entered phone number is not valid,');
    }
    if (emailRegExp.hasMatch(email) &&
        passwordRegExp.hasMatch(password) &&
        phoneNumber?.length == 10) {
          log("Inside auth bloc signup");
      final UserEntity userEntity = UserEntity(
        userEmail: email,
        userPassword: password,
        phoneNumber: phoneNumber,
        proffession: navigatorKey.currentContext!
            .read<AuthBloc>()
            .state
            .selectedProffession,
        userName: userName,
      );
      navigatorKey.currentContext!
          .read<AuthBloc>()
          .add(SignUpEvent(userEntity: userEntity));
    }
  }
}
