import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/core/common_widgets/common_container_button.dart';
import 'package:movie_hub/core/common_widgets/text_field_widget_common.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/core/enums/enums.dart';
import 'package:movie_hub/core/utils/auth_methods.dart';
import 'package:movie_hub/core/utils/message_show_helper.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.pageType,
  this.emailController,
    required this.passwordController,
    this.userNameController,
    this.phoneNumberController,
  });
  final PageType pageType;
  final TextEditingController? emailController;
  final TextEditingController passwordController;
  final TextEditingController? userNameController;
  final TextEditingController? phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: screenHeight(context: context),
          width: screenWidth(context: context),
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthErrorState) {
              MessageShowHelper.showSnackbar(
                  context: context, snackBarContent: state.message);
            }
            if (state is AuthSuccessState) {
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppRouteName.homePage,
                (route) => false,
              );
            }
          }, builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidgetCommon(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  text: pageType == PageType.login ? "Login" : "SignUp",
                ),
                kHeight30,
                TextFieldCommon(
                  hintText: "Enter user name",
                  border: const OutlineInputBorder(),
                  controller: userNameController,
                  textAlign: TextAlign.start,
                ),
               pageType == PageType.signUp? kHeight15:zeroMeasuredWidget,
                pageType == PageType.signUp
                    ? TextFieldCommon(
                        hintText: "Enter email",
                        border: const OutlineInputBorder(),
                        controller: emailController,
                        textAlign: TextAlign.start,
                      )
                    : zeroMeasuredWidget,
                kHeight15,
                TextFieldCommon(
                  hintText: "Enter password",
                  border: const OutlineInputBorder(),
                  controller: passwordController,
                  textAlign: TextAlign.start,
                ),
                kHeight15,
                pageType == PageType.signUp
                    ? TextFieldCommon(
                        prefix: TextWidgetCommon(
                          text: "+91",
                          textColor: kBlack.withOpacity(0.7),
                        ),
                        hintText: "Enter phone number",
                        border: const OutlineInputBorder(),
                        controller: phoneNumberController,
                        textAlign: TextAlign.start,
                      )
                    : zeroMeasuredWidget,
                kHeight15,
                pageType == PageType.signUp
                    ? BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<UserProffession>(
                              elevation: 0,
                              value: state.selectedProffession,
                              hint: Text(
                                state.selectedProffession != null
                                    ? state.selectedProffession!.name
                                    : "Select Profession",
                              ),
                              isExpanded: true,
                              items: UserProffession.values
                                  .map((UserProffession profession) {
                                return DropdownMenuItem<UserProffession>(
                                  value: profession,
                                  child: Text(
                                    profession.name,
                                  ),
                                );
                              }).toList(),
                              onChanged: (UserProffession? newValue) {
                                context.read<AuthBloc>().add(
                                    SelectProffessionEvent(
                                        selectedProffession: newValue));
                              },
                            ),
                          );
                        },
                      )
                    : zeroMeasuredWidget,
                kHeight15,
                commonContainerButton(
                  onTap: () {
                    if (pageType == PageType.login) {
                      AuthMethods.userLogin(
                          userName: userNameController?.text,
                          password: passwordController.text);
                    } else {
                      AuthMethods.userSignUp(
                        email: emailController?.text,
                        password: passwordController.text,
                        userName: userNameController?.text,
                        phoneNumber: phoneNumberController?.text,
                        userProffession:
                            context.read<AuthBloc>().state.selectedProffession,
                      );
                    }
                  },
                  buttonText: pageType == PageType.login ? "Login" : "SignUp",
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgetCommon(
                      text: pageType == PageType.login
                          ? "Don't have an account?"
                          : "Already have an account?",
                    ),
                    GestureDetector(
                      onTap: () {
                        if (pageType == PageType.login) {
                          navigatorKey.currentState
                              ?.pushNamed(AppRouteName.signUpPage);
                        } else {
                          navigatorKey.currentState
                              ?.pushNamed(AppRouteName.loginPage);
                        }
                      },
                      child: TextWidgetCommon(
                        text: pageType == PageType.login ? "SignUp" : "Login",
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
