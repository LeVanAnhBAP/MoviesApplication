import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<void> signInWithCredentials(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> signUp(String email, String password);

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<User?> getUser();
}
