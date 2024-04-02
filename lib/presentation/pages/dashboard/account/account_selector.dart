import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/sources/models/movie.dart';

import 'account_bloc.dart';
import 'account_state.dart';

class AccountStatusSelector
    extends BlocSelector<AccountBloc, AccountState, AccountStatus> {
  AccountStatusSelector({
    required Widget Function(AccountStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class AccountStatusListener extends BlocListener<AccountBloc, AccountState> {
  AccountStatusListener({
    required Iterable<AccountStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status &&
              statuses.contains(currentState.status),
        );
}

class GetIsSignInSelector
    extends BlocSelector<AccountBloc, AccountState, bool> {
  GetIsSignInSelector({
    required Widget Function(bool isSign) builder,
  }) : super(
          selector: (state) => state.isSignIn,
          builder: (_, isSign) => builder(isSign),
        );
}

class GetUserSelector extends BlocSelector<AccountBloc, AccountState, User?> {
  GetUserSelector({
    required Widget Function(User? user) builder,
  }) : super(
          selector: (state) => state.user,
          builder: (_, user) => builder(user),
        );
}

class MoviesWatchlistSelector extends BlocSelector<AccountBloc, AccountState, List<Movie>> {
  MoviesWatchlistSelector({
    required Widget Function(List<Movie> movies) builder,
  }) : super(
    selector: (state) => state.movies,
    builder: (_, status) => builder(status),
  );
}
