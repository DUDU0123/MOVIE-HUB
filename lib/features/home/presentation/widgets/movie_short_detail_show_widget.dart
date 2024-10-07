import 'package:flutter/material.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/utils/date_provider.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';

Widget movieShortDetailShowWidget({required MovieEntity movieData}) {
  final genresList = movieData.genres?.map((genre) => genre.name).toList();
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgetCommon(
          overflow: TextOverflow.ellipsis,
          text: movieData.originalTitle ?? movieData.title?? 'Unknown Movie',
          textColor: kBlack,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        commonMovieDetailsTextWidget(
          type: "Genre: ",
          data: genresList != null
              ? genresList.every((genre) => genre == 'Unknown')
                  ? "Unknown"
                  : genresList.join(',')
              : "Unknown",
        ),
        commonMovieDetailsTextWidget(
            type: "Average Vote: ", data: movieData.voteAverage!=null?'${movieData.voteAverage?.toInt()}/10':'0/10'),
        commonMovieDetailsTextWidget(
            type: "Lang: ",
            data:
                "${movieData.originalLanguage == 'en' ? 'English' : movieData.originalLanguage?.toUpperCase()}"),
        commonMovieDetailsTextWidget(
          type: null,
          data:
              "Released On ${movieData.releaseDate != null ? DateProvider.getDateInMonthDateFormat(
                  dateString: movieData.releaseDate.toString(),
                ) : '01 Jan'}",
        ),
        commonMovieDetailsTextWidget(
          type: null,
          color: kBlue,
          data:
              "${movieData.popularity?.round()} views Voted by ${movieData.voteCount} People",
        ),
      ],
    ),
  );
}

Widget commonMovieDetailsTextWidget(
    {required String? type, required String data, Color? color}) {
  return Row(
    children: [
      type != null
          ? TextWidgetCommon(
              overflow: TextOverflow.ellipsis,
              text: type,
              textColor: kGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )
          : zeroMeasuredWidget,
      Expanded(
        child: TextWidgetCommon(
          overflow: TextOverflow.ellipsis,
          text: data,
          textColor: color ?? kBlack,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
