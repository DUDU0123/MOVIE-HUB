  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/config/routes/routes_name.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';
import 'package:movie_hub/core/constants/texts.dart';
import 'package:movie_hub/core/utils/message_show_helper.dart';
import 'package:movie_hub/features/authentication/presentation/bloc/bloc/auth_bloc.dart';

BlocListener<AuthBloc, AuthState> homeMenu() {
    return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppRouteName.loginPage,
                (route) => false,
              );
            }
          },
          child: PopupMenuButton(
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    MessageShowHelper.showDialogBox(
                      context: context,
                      isCancelNeeded: false,
                      dialogTitle: "Company Info",
                      dialogContent: companyInfoText,
                      actionButtonName: "Ok",
                      buttonActionMethod: () {
                        navigatorKey.currentState?.pop();
                      },
                    );
                  },
                  child: const TextWidgetCommon(text: "Company Info"),
                ),
                PopupMenuItem(
                  onTap: () {
                    MessageShowHelper.showDialogBox(
                      context: context,
                      dialogTitle: "Log Out",
                      dialogContent: "Are you sure to logout?",
                      actionButtonName: "Logout",
                      buttonActionMethod: () {
                        context.read<AuthBloc>().add(LogOutEvent());
                        navigatorKey.currentState?.pop();
                      },
                    );
                  },
                  child: const TextWidgetCommon(text: "Log out"),
                ),
              ];
            },
          ),
        );
  }