import 'dart:async';

import 'package:movies_app/data/repositories/movie/movie.repository.dart';

import '../data/usecases/get_list_movies.dart';
import 'injector.dart';

FutureOr<void> registerUseCases() {
  provider.registerSingleton<GetMoviesUseCase>(
    GetMoviesUseCase(
      provider.get<MovieRepository>(),
    ),
  );
}
