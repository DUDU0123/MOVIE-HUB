import 'dart:convert';

import 'package:movie_hub/core/end_points/end_points.dart';
import 'package:movie_hub/features/home/data/model/genre/genre_model.dart';
import 'package:movie_hub/features/home/data/model/movie_model/movie_model.dart';
import 'package:http/http.dart' as http;

abstract interface class MovieData {
   Future<List<MovieModel>> getAllMovies();
}

class MovieDataImpl extends MovieData {
  @override
  Future<List<MovieModel>> getAllMovies() async {
    try {
      final genreList = await getAllGenres();
      final response = await http.get(
        Uri.parse(ApiEndPoints.trendingNow),
      );
      if (response.statusCode == 200) {

        final decodedData = json.decode(response.body)['results'] as List;
        final List<MovieModel> moviesList = decodedData
            .map(
              (movieData) => MovieModel.fromJson(movieData, genreList),
            )
            .toList();

        return moviesList;
      } else {
        throw Exception("Something Wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GenreModel>> getAllGenres() async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndPoints.genreList),
      );
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['genres'] as List;
        return decodedData.map((json) => GenreModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load genres");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
