import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithCredentialsUseCase signInWithCredentialsUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final CreateNewWatchlistUseCase createNewWatchlistUseCase;

  AuthBloc(
    this.signInWithCredentialsUseCase,
    this.resetPasswordUseCase,
    this.signUpUseCase,
    this.signOutUseCase,
    this.createNewWatchlistUseCase,
  ) : super(const AuthState()) {
    on<AuthErrorOccurred>(_onErrorOccurred);
    on<SignInStarted>(_onSignInStarted);
    on<SignupStarted>(_onSignupStarted);
    on<ResetPasswordStarted>(_onResetPasswordStarted);
    on<SignOutStarted>(_onSignOutStarted);
    on<CreateWatchlistStarted>(_onCreateWatchlistStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    AuthErrorOccurred event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      status: AuthStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onSignInStarted(
    SignInStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.loading,
      ));
      await signInWithCredentialsUseCase(event.params);
      emit(state.copyWith(
        status: AuthStatus.signInSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
      ));
    }
  }

  Future<void> _onSignupStarted(
    SignupStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      final user = await signUpUseCase(event.params);
      if (user != null) {
        WatchlistParams params =
            WatchlistParams(idMovies: ['-1'], idUser: user.uid);
        await createNewWatchlistUseCase(params);
      }
      emit(
        state.copyWith(
          status: AuthStatus.signupSuccess,
          user: user,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
      ));
    }
  }

  Future<void> _onResetPasswordStarted(
    ResetPasswordStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.loading,
      ));
      await resetPasswordUseCase(event.email);
      emit(state.copyWith(
        status: AuthStatus.resetPasswordSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
      ));
    }
  }

  Future<void> _onSignOutStarted(
    SignOutStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.loading,
      ));
      await signOutUseCase();
      emit(state.copyWith(
        status: AuthStatus.signOutSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
      ));
    }
  }

  Future<void> _onCreateWatchlistStarted(
    CreateWatchlistStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AuthStatus.loading,
      ));
      await createNewWatchlistUseCase(event.params);
      emit(state.copyWith(
        status: AuthStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
      ));
    }
  }
}
