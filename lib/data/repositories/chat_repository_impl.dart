import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource _chatDataSource;

  ChatRepositoryImpl(this._chatDataSource);

  @override
  Future<void> createChatRoom(List<String> users, String roomId) async {
    return await _chatDataSource.createChatRoom(users, roomId);
  }

  @override
  Future<void> sendMessage(String roomId, String message, String userId) async {
    return await _chatDataSource.sendMessage(roomId, message, userId);
  }

  @override
  Stream<QuerySnapshot> getMessagesStream(String roomId) {
    return _chatDataSource.getMessagesStream(roomId);
  }
}
