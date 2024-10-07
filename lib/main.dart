import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_hub/config/routes/app_routes.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/features/authentication/data/data_source/auth_data/authentication_data.dart';
import 'package:movie_hub/features/authentication/data/model/user_model/user_model.dart';
import 'package:movie_hub/features/authentication/data/repository/auth_repo/authentication_repository_impl.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_login_usecase.dart';
import 'package:movie_hub/features/authentication/domain/usecase/user_sign_up_usecase.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:movie_hub/features/home/data/data_source/movie_data/movie_data.dart';
import 'package:movie_hub/features/home/data/repository/movie_repo/movie_repository_impl.dart';
import 'package:movie_hub/features/home/domain/usecase/get_all_movies_usecase.dart';
import 'package:movie_hub/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  final userBox = await Hive.openBox<UserModel>('users');
  runApp(
    RootWidgetPage(
      userBox: userBox,
    ),
  );
}

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key, required this.userBox});
  final Box<UserModel?> userBox;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            userLoginUsecase: UserLoginUsecase(
              authenticationRepository: AuthenticationRepositoryImpl(
                authenticationData: AuthenticationDataImpl(userBox: userBox),
              ),
            ),
            userSignUpUsecase: UserSignUpUsecase(
              authenticationRepository: AuthenticationRepositoryImpl(
                authenticationData: AuthenticationDataImpl(userBox: userBox),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => MovieBloc(
            getAllMoviesUsecase: GetAllMoviesUsecase(
              movieRepository: MovieRepositoryImpl(
                movieData: MovieDataImpl(),
              ),
            ),
          )..add(GetAllMoviesEvent()),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouteName.wrapperPage,
        routes: AppRoutes.routes,
      ),
    );
  }
}
