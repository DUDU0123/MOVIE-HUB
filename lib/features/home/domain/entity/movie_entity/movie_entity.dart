import 'package:equatable/equatable.dart';
import 'package:movie_hub/features/home/domain/entity/genre/genre_entity.dart';

class MovieEntity extends Equatable {
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? posterPath;
  final String? originalLanguage;
  final List<GenreEntity>? genres;
  final double? popularity;
  final String? releaseDate;
  final int? voteCount;
  final int? viewedPeopleCount;
  final double? voteAverage;
  const MovieEntity({
    this.id,
    this.title,
    this.originalTitle,
    this.posterPath,
    this.originalLanguage,
    this.genres,
    this.popularity,
    this.releaseDate,
    this.voteCount,this.voteAverage,
    this.viewedPeopleCount,
  });


  @override
  List<Object?> get props {
    return [
      id,
      title,voteAverage,
      originalTitle,
      posterPath,
      originalLanguage,
      genres,
      popularity,
      releaseDate,
      voteCount,
      viewedPeopleCount,
    ];
  }
}
