import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:movie_hub/features/authentication/data/data_source/auth_data/authentication_data.dart';
import 'package:movie_hub/features/authentication/data/model/user_model/user_model.dart';
import 'package:movie_hub/features/authentication/data/repository/auth_repo/authentication_repository_impl.dart';
import 'package:movie_hub/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_sign_up_usecase.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:movie_hub/features/home/data/data_source/movie_data/movie_data.dart';
import 'package:movie_hub/features/home/data/repository/movie_repo/movie_repository_impl.dart';
import 'package:movie_hub/features/home/domain/repository/movie_repo/movie_repository.dart';
import 'package:movie_hub/features/home/domain/usecase/get_all_movies_usecase.dart';
import 'package:movie_hub/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await initHiveBoxDependencies(); // Initialize Hive Boxes
  initAuthDependencies();
  initMovieDependencies();
}

Future<void> initHiveBoxDependencies() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  final userBox = await Hive.openBox<UserModel>('users');
  serviceLocator.registerLazySingleton<Box<UserModel>>(() => userBox);
}

void initAuthDependencies() {
  serviceLocator
    ..registerFactory<AuthenticationData>(
      () => AuthenticationDataImpl(
        userBox: serviceLocator<Box<UserModel>>()
      ),
    )
    ..registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authenticationData: serviceLocator<AuthenticationData>()
      ),
    )
    ..registerFactory<UserLoginUsecase>(
      () => UserLoginUsecase(
        authenticationRepository: serviceLocator<AuthenticationRepository>(),
      ),
    )
    ..registerFactory(
      () => UserSignUpUsecase(
        authenticationRepository: serviceLocator<AuthenticationRepository>(),
      ),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userLoginUsecase: serviceLocator<UserLoginUsecase>(),
        userSignUpUsecase: serviceLocator<UserSignUpUsecase>(),
      ),
    );
}
void initMovieDependencies() {
  serviceLocator
    ..registerFactory<MovieData>(
      () => MovieDataImpl(
      ),
    )
    ..registerFactory<MovieRepository>(
      () => MovieRepositoryImpl(
        movieData: serviceLocator<MovieData>()
      ),
    )
    ..registerFactory<GetAllMoviesUsecase>(
      () => GetAllMoviesUsecase(
        movieRepository: serviceLocator<MovieRepository>(),
      ),
    )
    ..registerLazySingleton<MovieBloc>(
      () => MovieBloc(
        getAllMoviesUsecase: serviceLocator<GetAllMoviesUsecase>(),
      ),
    );
}
