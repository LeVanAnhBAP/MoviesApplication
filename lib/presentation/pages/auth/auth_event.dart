import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.errorOccurred([BaseException? error]) =
      AuthErrorOccurred;

  const factory AuthEvent.signIn(UserRequestParams params) = SignInStarted;
  const factory AuthEvent.signUp(UserRequestParams params) = SignupStarted;
  const factory AuthEvent.resetPassword(String email) = ResetPasswordStarted;
  const factory AuthEvent.signOut() = SignOutStarted;
}
