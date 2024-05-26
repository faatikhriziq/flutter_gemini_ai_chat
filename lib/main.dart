import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini_ai_chat/const.dart';


import 'module/chat_gemini_page.dart';


void main(){
  Gemini.init(
    apiKey: geminiApiKey,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatGeminiPage(),
    );
  }
}
