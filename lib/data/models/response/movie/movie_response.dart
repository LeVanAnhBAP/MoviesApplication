import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.freezed.dart';

@freezed
class MovieResponse with _$MovieResponse {
  factory MovieResponse({
    required String id,
    String? title,
    String? year,
    List<String>? genres,
    List<int>? ratings,
    String? poster,
    String? contentRating,
    String? duration,
    String? releaseDate,
    int? averageRating,
    String? originalTitle,
    String? storyline,
    List<String>? actors,
    dynamic imdbRating, // Kiểu dữ liệu động cho phép lưu cả String và double
    String? posterurl,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      id: json['id'] as String,
      title: json['title'] as String?,
      year: json['year'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      ratings:
          (json['ratings'] as List<dynamic>?)?.map((e) => e as int).toList(),
      poster: json['poster'] as String?,
      contentRating: json['contentRating'] as String?,
      duration: json['duration'] as String?,
      releaseDate: json['releaseDate'] as String?,
      averageRating: json['averageRating'] as int?,
      originalTitle: json['originalTitle'] as String?,
      storyline: json['storyline'] as String?,
      actors:
          (json['actors'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      imdbRating: _parseImdbRating(json['imdbRating']),
      posterurl: json['posterurl'] as String?,
    );
  }

  static dynamic _parseImdbRating(dynamic value) {
    if (value is String) {
      return value.isEmpty ? null : value;
    } else if (value is num) {
      return value.toDouble();
    } else {
      return null;
    }
  }
}
