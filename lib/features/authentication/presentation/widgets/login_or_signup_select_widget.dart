import 'package:flutter/material.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/core/enums/enums.dart';

Widget loginOrSignUpSelectWidget({required PageType pageType}) {
  return Row(
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
            navigatorKey.currentState?.pushNamed(AppRouteName.signUpPage);
          } else {
            navigatorKey.currentState?.pushNamed(AppRouteName.loginPage);
          }
        },
        child: TextWidgetCommon(
          text: pageType == PageType.login ? "SignUp" : "Login",
        ),
      ),
    ],
  );
}