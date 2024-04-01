import 'package:movies_app/core/exceptions/unknown_exception.dart';
import 'package:movies_app/data/repositories/user/user.repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl(
    this._firebaseAuth,
  );

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
}
