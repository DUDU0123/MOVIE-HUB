import 'package:flutter/material.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';

class MessageShowHelper {
  static void showDialogBox({
    required BuildContext context,
    required String dialogTitle,
    required String dialogContent,
    bool isCancelNeeded = true,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
        isCancelNeeded?  commonTextButton(
            buttonActionMethod: () {
              navigatorKey.currentState?.pop();
            },
            buttonText: 'Cancel',
          ):zeroMeasuredWidget,
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

  static void showSnackbar({
    required BuildContext context,
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: TextWidgetCommon(
            text: snackBarContent,
            textColor: kWhite,
            fontSize: 16,
          ),
          backgroundColor: kBlack,
          duration: const Duration(
            seconds: 1,
          ),
        ),
      );
  }
}

Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      fontSize: 16,
      text: buttonText,textColor: kBlack,
    ),
  );
}
