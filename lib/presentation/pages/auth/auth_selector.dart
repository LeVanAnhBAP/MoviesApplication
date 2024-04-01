import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc.dart';
import 'auth_state.dart';

class AuthStatusSelector
    extends BlocSelector<AuthBloc, AuthState, AuthStatus> {
  AuthStatusSelector({
    required Widget Function(AuthStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class AuthStatusListener extends BlocListener<AuthBloc, AuthState> {
  AuthStatusListener({
    required Iterable<AuthStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status &&
              statuses.contains(currentState.status),
        );
}
