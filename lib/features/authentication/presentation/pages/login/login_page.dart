import 'package:flutter/material.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/features/authentication/presentation/widgets/auth_widget_common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        pageType: PageType.login,
        userNameController: userNameController,
        passwordController: passwordController,
      ),
    );
  }
}
