import 'package:movies_app/core/extensions/string.dart';
import 'package:movies_app/data/models/response/movie/movie_response.dart';
import 'package:movies_app/data/sources/models/movie.dart';

extension MovieResponseConverter on MovieResponse {
  Movie toUI() {
    Movie movie = Movie(
      id: id,
      title: title ?? '',
      year: year ?? '',
      genres: genres ?? [],
      ratings: ratings ?? [],
      poster: poster ?? '',
      contentRating: contentRating ?? '',
      duration: duration?.formatDuration() ?? '',
      releaseDate: releaseDate ?? '',
      averageRating: averageRating ?? 0,
      originalTitle: originalTitle ?? '',
      storyline: storyline ?? '',
      actors: actors ?? [],
      imdbRating: imdbRating ?? 0,
      posterUrl: posterurl ?? '',
    );
    return movie;
  }
}

extension MoviesResponseConverter on List<MovieResponse> {
  List<Movie> toUI() {
    List<Movie> movies = map((e) => e.toUI()).toList();
    return movies;
  }
}
