import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRepository = ref.watch(chatRepositoryProvider);
    final roomIdController = useTextEditingController();
    final messageController = useTextEditingController();
    final roomId = useState<String>('');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.group),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Enter room ID'),
                    content: TextField(
                      controller: roomIdController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          roomId.value = roomIdController.text;
                          Navigator.pop(context);
                        },
                        child: const Text('Join'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatRepository.getMessagesStream(roomId.value),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final messageDoc = snapshot.data?.docs[index];
                    return ListTile(
                      title: Text(messageDoc?['message']),
                      subtitle: Text(messageDoc?['userId']),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:
                        const InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    await chatRepository.sendMessage(
                      roomId.value,
                      messageController.text,
                      'user-id', // Replace with actual user ID
                    );
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
