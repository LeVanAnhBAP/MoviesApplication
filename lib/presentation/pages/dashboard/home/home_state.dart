import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/data/sources/models/movie.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
  refreshing,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<Movie> movies,
    @Default([]) List<String> idMovies,
    @Default(false) bool isAddWatchlist,
    User? user,
    BaseException? error,
  }) = _HomeState;
}
