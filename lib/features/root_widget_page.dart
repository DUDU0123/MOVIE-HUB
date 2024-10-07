import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/config/routes/app_routes.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/core/service_locator/service_locator.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:movie_hub/features/home/presentation/bloc/movie/movie_bloc.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<MovieBloc>()..add(GetAllMoviesEvent()),
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
