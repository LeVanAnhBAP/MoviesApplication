import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/bases/usecases/base_use_case.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';
import 'package:movies_app/data/repositories/user/user.repository.dart';

class SignInWithCredentialsUseCase extends UseCase<void, UserRequestParams> {
  final UserRepository userRepository;

  SignInWithCredentialsUseCase(this.userRepository);

  @override
  Future<void> call(UserRequestParams params) {
    return userRepository.signInWithCredentials(params.email, params.password);
  }
}

class ResetPasswordUseCase extends UseCase<void, String> {
  final UserRepository userRepository;

  ResetPasswordUseCase(this.userRepository);

  @override
  Future<void> call(String params) {
    return userRepository.resetPassword(params);
  }
}

class SignUpUseCase extends UseCase<User?, UserRequestParams> {
  final UserRepository userRepository;

  SignUpUseCase(this.userRepository);

  @override
  Future<User?> call(UserRequestParams params) {
    return userRepository.signUp(params.email, params.password);
  }
}

class SignOutUseCase extends UseCase<void, NoParams> {
  final UserRepository userRepository;

  SignOutUseCase(this.userRepository);

  @override
  Future<void> call([NoParams? params]) {
    return userRepository.signOut();
  }
}

class GetIsSignedInUseCase extends UseCase<bool, NoParams> {
  final UserRepository userRepository;

  GetIsSignedInUseCase(this.userRepository);

  @override
  Future<bool> call([NoParams? params]) {
    return userRepository.isSignedIn();
  }
}

class GetUserUseCase extends UseCase<void, NoParams> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<User?> call([NoParams? params]) {
    return userRepository.getUser();
  }
}

class GetWatchlistUseCase extends UseCase<List<String>, String> {
  final UserRepository userRepository;

  GetWatchlistUseCase(this.userRepository);

  @override
  Future<List<String>> call(String params) {
    return userRepository.getWatchlist(params);
  }
}

class CreateNewWatchlistUseCase extends UseCase<void, WatchlistParams> {
  final UserRepository userRepository;

  CreateNewWatchlistUseCase(this.userRepository);

  @override
  Future<void> call(WatchlistParams params) {
    return userRepository.createNewWatchlist(params);
  }
}

class AddMovieToWatchlistUseCase extends UseCase<void, MovieFirebaseParams> {
  final UserRepository userRepository;

  AddMovieToWatchlistUseCase(this.userRepository);

  @override
  Future<void> call(MovieFirebaseParams params) {
    return userRepository.addMovieWatchlist(params);
  }
}

class RemoveMovieToWatchlistUseCase extends UseCase<void, WatchlistParams> {
  final UserRepository userRepository;

  RemoveMovieToWatchlistUseCase(this.userRepository);

  @override
  Future<void> call(WatchlistParams params) {
    return userRepository.deleteMovieWatchlist(params);
  }
}
