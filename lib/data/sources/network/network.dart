import 'package:movies_app/core/bases/responses/base_response.dart';
import 'package:movies_app/data/models/response/movie/movie_response.dart';
import 'package:movies_app/data/services/api/api.service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'network_urls.dart';

part 'network.g.dart';

@RestApi()
abstract class NetworkDataSource {
  factory NetworkDataSource(
    ApiServices apiServices, {
    String baseUrl,
  }) = _NetworkDataSource;

  @GET(NetworkUrls.getMovies)
  Future<BaseResponse<List<MovieResponse>>> getMovies();
}
