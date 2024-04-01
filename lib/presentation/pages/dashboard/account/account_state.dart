import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';

part 'account_state.freezed.dart';

enum AccountStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(AccountStatus.initial) AccountStatus status,
    @Default(false) bool isSignIn,
    User? user,
    BaseException? error,
  }) = _AccountState;
}
