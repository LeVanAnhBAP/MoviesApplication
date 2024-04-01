import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';

part 'auth_state.freezed.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  signInSuccess,
  signupSuccess,
  resetPasswordSuccess,
  signOutSuccess,
  failure,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    BaseException? error,
  }) = _AuthState;
}
