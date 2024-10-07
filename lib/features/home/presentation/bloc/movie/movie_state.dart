part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}
class MoviesLoadingState extends MovieState{

}
class MoviesLoadedState extends MovieState {
  final List<MovieEntity> moviesList;
  const MoviesLoadedState({
    required this.moviesList,
  });
  @override
  List<Object> get props => [moviesList];
}

class MoviesErrorState extends MovieState {
  final String message;
  const MoviesErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
