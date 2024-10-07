import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call({
    required Params params,
  });
}

