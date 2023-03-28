import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<UserCredential> signUp(String email, String password) async {
    return await _authDataSource.signUp(email, password);
  }

  @override
  Future<UserCredential> signIn(String email, String password) async {
    return await _authDataSource.signIn(email, password);
  }
}
