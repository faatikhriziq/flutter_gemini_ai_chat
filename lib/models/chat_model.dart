// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    final int id;
    final String posisi;
    final String chat;
    final DateTime createdDate;
    final String type;
    final String status;

    ChatModel({
        required this.id,
        required this.posisi,
        required this.chat,
        required this.createdDate,
        required this.type,
        required this.status,
    });

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        posisi: json["posisi"],
        chat: json["chat"],
        createdDate: DateTime.parse(json["createdDate"]),
        type: json["type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "posisi": posisi,
        "chat": chat,
        "createdDate": createdDate.toIso8601String(),
        "type": type,
        "status": status,
    };
}
