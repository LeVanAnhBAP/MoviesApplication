import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';

part 'account_event.freezed.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.errorOccurred([BaseException? error]) =
      AccountErrorOccurred;

  const factory AccountEvent.isSignIn() = IsSignInCheck;

  const factory AccountEvent.getUser() = GetUserStarted;

  const factory AccountEvent.getWatchlist(String idUser) = GetWatchlistStarted;

  const factory AccountEvent.signOut() = SignOutStarted;

}
