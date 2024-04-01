import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithCredentialsUseCase signInWithCredentialsUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc(
    this.signInWithCredentialsUseCase,
    this.resetPasswordUseCase,
    this.signUpUseCase,
    this.signOutUseCase,
  ) : super(const AuthState()) {
    on<AuthErrorOccurred>(_onErrorOccurred);
    on<SignInStarted>(_onSignInStarted);
    on<SignupStarted>(_onSignupStarted);
    on<ResetPasswordStarted>(_onResetPasswordStarted);
    on<SignOutStarted>(_onSignOutStarted);
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
    ));
  }

  FutureOr<void> _onSignInStarted(
    SignInStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.loading,
    ));
    await signInWithCredentialsUseCase(event.params);
    emit(state.copyWith(
      status: AuthStatus.signInSuccess,
    ));
  }

  Future<void> _onSignupStarted(
    SignupStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
      ),
    );
    await signUpUseCase(event.params);
    emit(
      state.copyWith(
        status: AuthStatus.signupSuccess,
      ),
    );
  }

  Future<void> _onResetPasswordStarted(
    ResetPasswordStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.loading,
    ));
    await resetPasswordUseCase(event.email);
    emit(state.copyWith(
      status: AuthStatus.resetPasswordSuccess,
    ));
  }

  Future<void> _onSignOutStarted(
    SignOutStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.loading,
    ));
    await signOutUseCase();
    emit(state.copyWith(
      status: AuthStatus.signOutSuccess,
    ));
  }
}
