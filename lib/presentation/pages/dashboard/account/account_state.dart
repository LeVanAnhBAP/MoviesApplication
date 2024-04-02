import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/data/sources/models/movie.dart';

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
    @Default([]) List<String> idMovies,
    @Default([]) List<Movie> movies,
    BaseException? error,
  }) = _AccountState;
}
