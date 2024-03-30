import 'dart:async';

import 'package:movies_app/data/repositories/movie/movie.repository.impl.dart';
import 'package:movies_app/data/sources/network/network.dart';

import '../data/repositories/movie/movie.repository.dart';
import 'injector.dart';

FutureOr<void> registerRepositories() {
  provider.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(
      provider.get<NetworkDataSource>(),
    ),
  );
}
