import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/common_widgets/common_circular_progress_indicator.dart';
import 'package:movie_hub/core/constants/colors.dart';
import 'package:movie_hub/core/constants/height_width.dart';
import 'package:movie_hub/core/end_points/base_urls.dart';
import 'package:movie_hub/core/utils/message_show_helper.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';
import 'package:movie_hub/features/home/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_hub/features/home/presentation/widgets/movie_home_small_widgets.dart';
import 'package:movie_hub/features/home/presentation/widgets/movie_short_detail_show_widget.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MoviesErrorState) {
          MessageShowHelper.showSnackbar(
              context: context, snackBarContent: state.message);
        }
      },
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return commonCircularProgressIndicator();
        }
        if (state is MoviesLoadedState) {
          return StreamBuilder<List<MovieEntity>>(
              stream: state.moviesList,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return commonEmptyTextWidget();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return commonCircularProgressIndicator();
                }
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  separatorBuilder: (context, index) => kHeight10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: kWhite,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: kGrey.withOpacity(0.3),
                          ),
                        ],
                      ),
                      width: screenWidth(context: context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              votesAddingWidget(),
                              movieThumbNail(
                                  image:
                                      '$kImageBaseUrl${snapshot.data![index].posterPath}'),
                              kWidth10,
                              Expanded(
                                child: movieShortDetailShowWidget(
                                    movieData: snapshot.data![index]),
                              )
                            ],
                          ),
                          kHeight5,
                          watchTrailerButtonWidget()
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              });
        }
        return commonEmptyTextWidget();
      },
    );
  }
}
