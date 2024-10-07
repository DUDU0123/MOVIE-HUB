import 'package:movie_hub/features/home/data/model/genre/genre_model.dart';
import 'package:movie_hub/features/home/domain/entity/movie_entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    super.id,
    super.title,
    super.originalTitle,
    super.posterPath,
    super.originalLanguage,
    super.genres,
    super.popularity,
    super.releaseDate,
    super.voteCount,
    super.viewedPeopleCount,super.voteAverage,
  });

  factory MovieModel.fromJson(
      Map<String, dynamic> json, List<GenreModel> genreList) {
    List<GenreModel> movieGenres = (json['genre_ids'] as List).map((id) {
      return genreList.firstWhere((genre) => genre.id == id,
          orElse: () => const GenreModel(id: 0, name: 'Unknown'));
    }).toList();

    return MovieModel(
      id: json['id'],
      voteAverage: json['vote_average'],
      title: json['title'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      originalLanguage: json['original_language'],
      genres: movieGenres, // Assign the genres to the model
      popularity: json['popularity'].toDouble(),
      releaseDate: json['release_date'],
      voteCount: json['vote_count'],
      viewedPeopleCount: json['vote_count'],
    );
  }

  // A method to convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'poster_path': posterPath,
      'original_language': originalLanguage,
      'genres': genres?.map(
        (genre) =>
            genres?.map((genre) => (genre as GenreModel).toJson()).toList(),
      ), // Convert genres to JSON
      'popularity': popularity,
      'release_date': releaseDate,
      'vote_count': voteCount,
      'vote_average': voteAverage,
      'viewed_people_count': viewedPeopleCount,
    };
  }
}
