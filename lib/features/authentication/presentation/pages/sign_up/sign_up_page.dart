import 'package:flutter/material.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/features/authentication/presentation/widgets/auth_widget_common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    TextEditingController? userNameController= TextEditingController();
   TextEditingController? phoneNumberController = TextEditingController();

   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController?.dispose();
    phoneNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        phoneNumberController: phoneNumberController,
        userNameController: userNameController,
        emailController: emailController,
        passwordController: passwordController,
        pageType: PageType.signUp,
      ),
    );
  }
}
