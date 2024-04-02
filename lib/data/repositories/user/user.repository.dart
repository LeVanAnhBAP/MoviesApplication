import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';

abstract class UserRepository {
  Future<void> signInWithCredentials(String email, String password);

  Future<void> resetPassword(String email);

  Future<User?> signUp(String email, String password);

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<User?> getUser();

  Future<void> createNewWatchlist(WatchlistParams params);

  Future<List<String>> getWatchlist(String idUser);

  Future<void> addMovieWatchlist(MovieFirebaseParams params);

  Future<void> deleteMovieWatchlist(WatchlistParams params);
}
