import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/core/utils/common_functions.dart';
import 'package:movie_hub/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_sign_up_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUsecase _userLoginUsecase;

  final UserSignUpUsecase _userSignUpUsecase;
    
  AuthBloc({
    required UserLoginUsecase userLoginUsecase,
    required UserSignUpUsecase userSignUpUsecase,
  })  : _userLoginUsecase = userLoginUsecase,
        _userSignUpUsecase = userSignUpUsecase,
        super(const AuthInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<LogInEvent>(logInEvent);
    on<CheckUserLoggedInEvent>(checkUserLoggedInEvent);
    on<LogOutEvent>(logOutEvent);
    on<SelectProffessionEvent>(selectProffessionEvent);
  }

  FutureOr<void> signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      final res = await _userSignUpUsecase(
        params: event.userEntity,
      );
      res.fold(
        (l) {
          emit(AuthErrorState(message: l.message));
        },
        (isSignedIn) {
          if (isSignedIn) {
            CommonFunctions.setUserAuthStatus(isLoggedIn: true);
            emit(AuthSuccessState());
          } else {
            emit(const AuthErrorState(message: "Unable to make user sign up"));
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> logInEvent(
      LogInEvent event, Emitter<AuthState> emit) async {
    try {
      final res = await _userLoginUsecase(
        params: event.userEntity,
      );
      res.fold(
        (l) {
          emit(AuthErrorState(message: l.message));
        },
        (isUserExists) {
          if (isUserExists) {
            CommonFunctions.setUserAuthStatus(isLoggedIn: true);
            emit(AuthSuccessState());
          } else {
            emit(const AuthErrorState(message: "Invalid credentials"));
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> checkUserLoggedInEvent(
      CheckUserLoggedInEvent event, Emitter<AuthState> emit) async {
    try {
      final isLoggedIn = await CommonFunctions.getUserAuthStatus();
      emit(AuthInitial(isLoggedIn: isLoggedIn));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> logOutEvent(
      LogOutEvent event, Emitter<AuthState> emit) async {
    try {
      await CommonFunctions.setUserAuthStatus(isLoggedIn: false);
      emit(const AuthInitial(isLoggedIn: false));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  FutureOr<void> selectProffessionEvent(
      SelectProffessionEvent event, Emitter<AuthState> emit) {
    try {
      emit(state.copyWith(selectedProffession: event.selectedProffession));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
