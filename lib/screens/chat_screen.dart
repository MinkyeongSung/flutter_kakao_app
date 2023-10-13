import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/components/chat_card.dart';
import 'package:flutter_kakao_app/models/chat.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("채팅"),
      ),
      body: ListView(
        children: List.generate(
          chats.length,
              (index) => ChatCard(chat: chats[index]),
        ),
      ),
    );
  }
}