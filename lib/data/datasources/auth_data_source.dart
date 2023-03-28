import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSource(this._firebaseAuth);

  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
