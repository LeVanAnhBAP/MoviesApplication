import 'package:firebase_database/firebase_database.dart';
import 'package:movies_app/core/exceptions/unknown_exception.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';
import 'package:movies_app/data/repositories/user/user.repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final DatabaseReference _database;

  UserRepositoryImpl(this._firebaseAuth, this._database);

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user;
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<User?> getUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user;
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> signInWithCredentials(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> createNewWatchlist(WatchlistParams params) async {
    try {
      DatabaseReference newListRef = _database.child('watchlist');
      await newListRef.set({
        params.idUser: params.idMovies,
      });
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> addMovieWatchlist(MovieFirebaseParams params) async {
    try {
      DatabaseReference watchlistRef =
          _database.child('watchlist').child(params.idUser).push();
      await watchlistRef.set(params.idMovie);
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<void> deleteMovieWatchlist(WatchlistParams params) async {
    try {
      DatabaseReference watchlistRef = _database.child('watchlist');
      await watchlistRef.update({params.idUser: params.idMovies});
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<List<String>> getWatchlist(String idUser) async {
    try {
      final snapshot = await _database.child('watchlist/$idUser').get();
      if (snapshot.exists) {
        final dynamic data = snapshot.value;
        if (data is List) {
          List<String> idMovies =
              data.map((value) => value.toString()).toList();
          return idMovies;
        } else if (data is Map) {
          List<String> idMovies =
              data.values.map((value) => value.toString()).toList();
          return idMovies;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      throw UnknownException(e);
    }
  }
}
