import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasources/auth_data_source.dart';
import '../data/datasources/chat_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/chat_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/chat_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(AuthDataSource(FirebaseAuth.instance)),
);

final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ChatRepositoryImpl(ChatDataSource(FirebaseFirestore.instance)),
);
