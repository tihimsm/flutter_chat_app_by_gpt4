import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDataSource {
  final FirebaseFirestore _firestore;

  ChatDataSource(this._firestore);

  Future<void> createChatRoom(List<String> users, String roomId) async {
    await _firestore.collection('chatRooms').doc(roomId).set({
      'users': users,
    });
  }

  Future<void> sendMessage(String roomId, String message, String userId) async {
    await _firestore
        .collection('chatRooms')
        .doc(roomId)
        .collection('messages')
        .add({
      'message': message,
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getMessagesStream(String roomId) {
    return _firestore
        .collection('chatRooms')
        .doc(roomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
