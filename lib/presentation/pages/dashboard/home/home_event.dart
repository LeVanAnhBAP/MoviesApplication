import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.errorOccurred([BaseException? error]) =
      HomeErrorOccurred;

  const factory HomeEvent.getDataStarted() = DashboardHomeGetDataStarted;

  const factory HomeEvent.addMovieToWatchlist(MovieFirebaseParams params) = AddMovieToWatchlistStarted;

  const factory HomeEvent.removeMovieToWatchlist(String idUser, String idMovie) = RemoveMovieToWatchlistStarted;

  const factory HomeEvent.getWatchlist(String idUser, String idMovie) = GetWatchlistStarted;

  const factory HomeEvent.getUser() = GetUserStarted;

  const factory HomeEvent.getRefreshData() = HomeRefreshData;
}
