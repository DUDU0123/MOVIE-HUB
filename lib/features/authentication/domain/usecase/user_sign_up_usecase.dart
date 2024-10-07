import 'package:fpdart/fpdart.dart';

import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/core/usecase/usecase.dart';
import 'package:movie_hub/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:movie_hub/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class UserSignUpUsecase implements Usecase<bool, UserEntity> {
  final AuthenticationRepository authenticationRepository;
  UserSignUpUsecase({
    required this.authenticationRepository,
  });
  @override
  Future<Either<Failure, bool>> call({required UserEntity params}) async {
    return await authenticationRepository.userSignUp(
      userName: params.userName!,
      userPassword: params.userPassword!,
      userPhoneNumber: params.phoneNumber!,
      userEmail: params.userEmail!,
      proffession: params.proffession!,
    );
  }
}
