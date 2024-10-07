import 'package:flutter/material.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';

Widget commonContainerButton({required String buttonText,void Function()? onTap, Color? containerColor,Gradient? gradient,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: screenWidth(context: navigatorKey.currentContext!) / 2.3,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
          color: containerColor??kRed,
        ),
        child: Center(
          child: TextWidgetCommon(
            fontSize: 18,
            text: buttonText,
          ),
        ),
      ),
    );
  }