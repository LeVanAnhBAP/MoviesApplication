import 'dart:convert';

import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/core/exceptions/unknown_exception.dart';
import 'package:movies_app/data/models/response/movie/movie_response.dart';
import 'package:movies_app/data/sources/network/network.dart';

import 'movie.repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final NetworkDataSource _networkDataSource;

  MovieRepositoryImpl(
    this._networkDataSource,
  );

  @override
  Future<List<MovieResponse>> getMovies() async {
    try {
      final res = await _networkDataSource.getMovies();
      final data = jsonDecode(res) as List<dynamic>;
      final List<MovieResponse> movies =
          data.map((json) => MovieResponse.fromJson(json)).toList();
      return movies;
    } on BaseException {
      rethrow;
    } catch (e) {
      throw UnknownException(e);
    }
  }
}
