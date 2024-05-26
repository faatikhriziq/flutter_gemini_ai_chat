import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatGeminiNotifier extends ChangeNotifier {
  final BuildContext context;

  ChatGeminiNotifier({required this.context});
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> listMessage = [];
  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "Faatikh Riziq",
  );
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "GEMINI AI",
  );

  sendMessage(ChatMessage value) {
    listMessage = [value, ...listMessage];
    try {
      String values = value.text;
      gemini.streamGenerateContent(values).listen((e) {
        String response = e.content!.parts
                ?.fold("", (b, a) => "$b ${a.text}") ??
            '';
        ChatMessage resultMessage = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response,
        );
        listMessage = [resultMessage, ...listMessage];
        notifyListeners();
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
