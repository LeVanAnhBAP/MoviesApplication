import 'package:movies_app/data/models/response/movie/movie_response.dart';

abstract class MovieRepository {
  Future<List<MovieResponse>> getMovies();
}
