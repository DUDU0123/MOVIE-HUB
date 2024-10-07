import 'package:fpdart/fpdart.dart';

import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/home/data/data_source/movie_data/movie_data.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';
import 'package:movie_hub/features/home/domain/repository/movie_repo/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieData movieData;
  MovieRepositoryImpl({
    required this.movieData,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async{
    try {
      final moviesList = await movieData.getAllMovies();
      return right(moviesList);
    } catch (e) {
      return left(Failure(message:  e.toString()));
    }
  }
  
}
