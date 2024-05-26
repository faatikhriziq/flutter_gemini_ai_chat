import 'package:flutter/material.dart';
import 'package:flutter_gemini_ai_chat/module/chat_gemini_notifier.dart';

import 'package:provider/provider.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatGeminiPage extends StatelessWidget {
  const ChatGeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatGeminiNotifier(context: context),
      child: Consumer<ChatGeminiNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              "Flutter Gemini AI Chat",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: const Padding(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/pp.jpg",
                ),
                radius: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey[300],
          body: Center(
            child: Container(
              color: Colors.grey[300],
              child: DashChat(
                currentUser: value.currentUser,
                onSend: value.sendMessage,
                messages: value.listMessage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
