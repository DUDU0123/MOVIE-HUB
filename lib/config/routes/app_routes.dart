
import 'package:flutter/material.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/features/authentication/presentation/pages/login/login_page.dart';
import 'package:movie_hub/features/authentication/presentation/pages/sign_up/sign_up_page.dart';
import 'package:movie_hub/features/home/presentation/pages/home_page.dart';
import 'package:movie_hub/features/wrapper/presentation/pages/wrapper_page.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.wrapperPage: (context)=> const WrapperPage(),
    AppRouteName.loginPage: (context)=> const LoginPage(),
    AppRouteName.signUpPage: (context)=> const SignUpPage(),
    AppRouteName.homePage: (context)=>const HomePage(),
  };
}