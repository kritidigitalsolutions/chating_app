import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  void sendMessage() {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    // Add user message
    messages.add(ChatMessage(message: text, isMe: true));

    messageController.clear();

    // Optional: fake reply after delay
    Future.delayed(const Duration(milliseconds: 800), () {
      messages.add(ChatMessage(message: "Hello Amit kumar 🙂", isMe: false));
    });
  }
}

class ChatMessage {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});
}
