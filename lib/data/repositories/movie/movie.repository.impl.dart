import 'package:dio/dio.dart';
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
      return res.data;
    } on BaseException {
      rethrow;
    } catch (e) {
      throw UnknownException(e);
    }
  }
}
