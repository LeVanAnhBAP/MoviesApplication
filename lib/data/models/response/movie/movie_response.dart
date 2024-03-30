import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final String id;
  final String? title;
  final String? year;
  final List<String>? genres;
  final List<int>? ratings;
  final String? poster;
  final String? contentRating;
  final String? duration;
  final String? releaseDate;
  final int? averageRating;
  final String? originalTitle;
  final String? storyline;
  final List<String>? actors;
  final String? imdbRating;
  final String? posterUrl;

  MovieResponse({
    required this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterUrl,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
