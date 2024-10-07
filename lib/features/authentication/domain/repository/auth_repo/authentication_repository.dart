import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/core/error/failure.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, bool>> userSignUp({
    required String userName,
    required String userPassword,
    required String userPhoneNumber,
    required String userEmail,
    required UserProffession proffession,
  });
  Future<Either<Failure, bool>> userLogin({
    required String userName,
    required String userPassword,
  });
}
