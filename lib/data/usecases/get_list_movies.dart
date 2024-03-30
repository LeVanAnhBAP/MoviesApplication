import 'package:movies_app/core/bases/usecases/base_use_case.dart';
import 'package:movies_app/data/models/response/movie/movie_response.dart';
import 'package:movies_app/data/repositories/movie/movie.repository.dart';

class GetMoviesUseCase extends UseCase<List<MovieResponse>, NoParams?> {
  final MovieRepository movieRepository;

  GetMoviesUseCase(this.movieRepository);

  @override
  Future<List<MovieResponse>> call([NoParams? params]) {
    return movieRepository.getMovies();
  }
}
