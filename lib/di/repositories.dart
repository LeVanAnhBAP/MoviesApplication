import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/repositories/movie/movie.repository.impl.dart';
import 'package:movies_app/data/repositories/user/user.repository.dart';
import 'package:movies_app/data/repositories/user/user.repository.impl.dart';
import 'package:movies_app/data/sources/network/network.dart';

import '../data/repositories/movie/movie.repository.dart';
import 'injector.dart';

FutureOr<void> registerRepositories() {
  provider.registerSingleton<MovieRepository>(
    MovieRepositoryImpl(
      provider.get<NetworkDataSource>(),
    ),
  );

  provider.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      provider.get<FirebaseAuth>(),
    ),
  );
}
