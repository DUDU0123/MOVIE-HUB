
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/core/usecase/usecase.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';
import 'package:movie_hub/features/home/domain/repository/movie_repo/movie_repository.dart';

class GetAllMoviesUsecase implements Usecase<Stream<List<MovieEntity>>, Null> {
  final MovieRepository movieRepository;
  GetAllMoviesUsecase({
    required this.movieRepository,
  });
  @override
  Future<Either<Failure, Stream<List<MovieEntity>>>> call({required Null params})async {
    return await movieRepository.getAllMovies();
  }

}
