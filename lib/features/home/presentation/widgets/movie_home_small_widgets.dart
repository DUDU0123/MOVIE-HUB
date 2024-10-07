
import 'package:flutter/material.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/constants/navigator_key.dart';

Widget watchTrailerButtonWidget() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: kBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      fixedSize: Size.fromWidth(
        screenWidth(context: navigatorKey.currentContext!),
      ),
    ),
    onPressed: () {},
    child: const TextWidgetCommon(
      text: "Watch Trailer",
      textColor: kWhite,
    ),
  );
}

Widget commonEmptyTextWidget() {
  return const Center(
    child: TextWidgetCommon(text: "No movies found"),
  );
}

Widget votesAddingWidget() {
  return const  SizedBox(
    width: 50,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_drop_up,
          size: 45,
        ),
        TextWidgetCommon(
          text: "1",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        Icon(
          Icons.arrow_drop_down,
          size: 45,
        ),
        TextWidgetCommon(
          text: "Votes",
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}


Widget movieThumbNail({required String? image}) {
  return Container(
    width: 90,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 2,
          color: kGrey.withOpacity(0.5),
        ),
      ],
      color: kYellow,
      borderRadius: BorderRadius.circular(15),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: image != null
          ? Image.network(
              fit: BoxFit.cover,
              image,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.photo);
              },
            )
          : const Icon(Icons.photo),
    ),
  );
}
