import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getMessage();
  }

  List<String> chats = [];
  TextEditingController chat = TextEditingController();
  void addMessage() {
    chats.add(chat.text);
    chat.clear();
    notifyListeners();
  }

  List<ChatModel> listMessage = [];
  void getMessage() async {
    Dio dio = Dio();
    var response = await dio.get("https://tegaldev.metimes.id/chat-sample");
    var result = jsonDecode(response.data);
    print(result);
    for (Map<String, dynamic> i in result["data"]) {
      listMessage.add(ChatModel.fromJson(i));
    }
    print(listMessage);
  }
}
