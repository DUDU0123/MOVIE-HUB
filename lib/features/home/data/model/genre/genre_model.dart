import 'package:movie_hub/features/home/domain/entity/genre/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({
    super.id,
    super.name,
  });
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
