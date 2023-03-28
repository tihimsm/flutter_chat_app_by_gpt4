import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepository {
  Future<void> createChatRoom(List<String> users, String roomId);
  Future<void> sendMessage(String roomId, String message, String userId);
  Stream<QuerySnapshot> getMessagesStream(String roomId);
}
