import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';

abstract interface class MovieRepository{
   Future<Either<Failure, Stream<List<MovieEntity>>>> getAllMovies();
}