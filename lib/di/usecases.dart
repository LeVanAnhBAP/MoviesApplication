import 'dart:async';

import 'package:movies_app/data/repositories/movie/movie.repository.dart';
import 'package:movies_app/data/repositories/user/user.repository.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import '../data/usecases/get_list_movies.dart';
import 'injector.dart';

FutureOr<void> registerUseCases() {
  provider.registerSingleton<GetMoviesUseCase>(
    GetMoviesUseCase(
      provider.get<MovieRepository>(),
    ),
  );

  provider.registerSingleton<SignInWithCredentialsUseCase>(
    SignInWithCredentialsUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<ResetPasswordUseCase>(
    ResetPasswordUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<SignOutUseCase>(
    SignOutUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<GetIsSignedInUseCase>(
    GetIsSignedInUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<GetUserUseCase>(
    GetUserUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<CreateNewWatchlistUseCase>(
    CreateNewWatchlistUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<AddMovieToWatchlistUseCase>(
    AddMovieToWatchlistUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<RemoveMovieToWatchlistUseCase>(
    RemoveMovieToWatchlistUseCase(
      provider.get<UserRepository>(),
    ),
  );

  provider.registerSingleton<GetWatchlistUseCase>(
    GetWatchlistUseCase(
      provider.get<UserRepository>(),
    ),
  );
}
