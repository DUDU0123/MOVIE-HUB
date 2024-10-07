import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:movie_hub/features/authentication/presentation/pages/login/login_page.dart';
import 'package:movie_hub/features/home/presentation/pages/home_page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckUserLoggedInEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          if (state.isLoggedIn??false) {
            return const HomePage();
          }else{
            return const LoginPage();
          }
        }else{
          return const LoginPage();
        }
      }
    );
  }
}