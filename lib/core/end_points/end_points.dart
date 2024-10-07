import 'package:movie_hub/config/secrets/api_key.dart';
import 'package:movie_hub/core/end_points/base_urls.dart';

class ApiEndPoints {
  static const trendingNow = '$kBaseUrl/trending/all/day?api_key=$apiKey';
  static const genreList = '$kBaseUrl/genre/movie/list?api_key=$apiKey';
}

