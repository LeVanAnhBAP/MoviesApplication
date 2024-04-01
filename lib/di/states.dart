import 'dart:async';

import 'package:movies_app/data/usecases/get_list_movies.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';
import 'package:movies_app/presentation/pages/auth/auth_bloc.dart';
import 'package:movies_app/presentation/pages/dashboard/account/account_bloc.dart';
import 'package:movies_app/presentation/pages/dashboard/home/home_bloc.dart';

import 'injector.dart';

FutureOr<void> registerStates() async {
  provider.registerSingleton<HomeBloc>(
    HomeBloc(
      provider.get<GetMoviesUseCase>(),
    ),
  );

  provider.registerSingleton<AccountBloc>(
    AccountBloc(
      provider.get<GetIsSignedInUseCase>(),
      provider.get<GetUserUseCase>(),
    ),
  );

  provider.registerSingleton<AuthBloc>(
    AuthBloc(
      provider.get<SignInWithCredentialsUseCase>(),
      provider.get<ResetPasswordUseCase>(),
      provider.get<SignUpUseCase>(),
      provider.get<SignOutUseCase>(),
    ),
  );
}
