import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';
import 'package:movie_hub/features/home/domain/usecase/get_all_movies_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMoviesUsecase _getAllMoviesUsecase;
  MovieBloc({
    required GetAllMoviesUsecase getAllMoviesUsecase,
  })  : _getAllMoviesUsecase = getAllMoviesUsecase,
        super(MovieInitial()) {
    on<GetAllMoviesEvent>(getAllMoviesEvent);
  }

  FutureOr<void> getAllMoviesEvent(
      GetAllMoviesEvent event, Emitter<MovieState> emit) async {
    emit(MoviesLoadingState());
    try {
      final res = await _getAllMoviesUsecase(
        params: null,
      );
      res.fold(
        (failure) {
          emit(MoviesErrorState(message: failure.message));
        },
        (moviesList) {
          emit(MoviesLoadedState(moviesList: moviesList));
        },
      );
    } catch (e) {
      emit(MoviesErrorState(message: e.toString()));
    }
  }
}
