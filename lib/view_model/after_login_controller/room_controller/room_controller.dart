import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RoomTypeChatController extends GetxController {
  final messageController = TextEditingController();

  RxList<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      name: "Neha",
      message: "What are you doing?",
      isMe: false,
      time: "2:15 pm",
    ),
    ChatMessage(
      name: "Vikrant",
      message: "Everything is going well",
      isMe: true,
      time: "2:16 pm",
    ),
  ].obs;

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    messages.add(
      ChatMessage(
        name: "Vikrant",
        message: messageController.text.trim(),
        isMe: true,
        time: DateFormat('hh:mm a').format(DateTime.now()),
      ),
    );

    messageController.clear();

    // Dummy reply (optional)
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        ChatMessage(
          name: "Neha",
          message: "Okay 👍",
          isMe: false,
          time: DateFormat('hh:mm a').format(DateTime.now()),
        ),
      );
    });
  }
}

class ChoosePlanController extends GetxController {
  RxnString plan = RxnString();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    clear();
  }

  void toggel(String value) {
    plan.value = value;
  }

  void clear() {
    plan.value = null;
  }
}

class ChatMessage {
  final String name;
  final String message;
  final bool isMe;
  final String time;

  ChatMessage({
    required this.name,
    required this.message,
    required this.isMe,
    required this.time,
  });
}

class RoomCreatingController extends GetxController {
  final ImagePicker picker = ImagePicker();

  final Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    // if(pick)
  }
}
