import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/room_controller/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsRoomPage extends StatelessWidget {
  FriendsRoomPage({super.key});

  final RoomTypeChatController controller = Get.put(RoomTypeChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.graPurple1,
              AppColors.gradientBlack,
              AppColors.balckBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ChatHeader(),

              Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.graPurple2, AppColors.graPurple1],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(child: ChatList()),
              ChatInputBar(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────── HEADER ───────────── */

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Friends Room 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Chill, chat, and enjoy together!",
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.handshake, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/* ───────────── CHAT LIST ───────────── */

class ChatList extends StatelessWidget {
  ChatList({super.key});

  final RoomTypeChatController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          final msg = controller.messages[index];

          return msg.isMe
              ? RightMessage(
                  name: msg.name,
                  message: msg.message,
                  time: msg.time,
                )
              : LeftMessage(
                  name: msg.name,
                  message: msg.message,
                  time: msg.time,
                );
        },
      ),
    );
  }
}

/* ───────────── LEFT MESSAGE ───────────── */

class LeftMessage extends StatelessWidget {
  final String name, message, time;

  const LeftMessage({
    super.key,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.mainColors.withAlpha(50),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    name,
                    style: textStyle15(FontWeight.w500, color: AppColors.white),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: textStyle13(FontWeight.w500, color: AppColors.white),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white38, fontSize: 10),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.done_all, color: AppColors.green, size: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────── RIGHT MESSAGE ───────────── */

class RightMessage extends StatelessWidget {
  final String name, message, time;

  const RightMessage({
    super.key,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.balckBlue.withAlpha(150),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    name,
                    style: textStyle15(FontWeight.w500, color: AppColors.white),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              Text(
                message,
                style: textStyle13(FontWeight.w500, color: AppColors.white),
              ),

              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white38, fontSize: 10),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.done_all, color: AppColors.green, size: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────── INPUT BAR ───────────── */

class ChatInputBar extends StatelessWidget {
  ChatInputBar({super.key});

  final RoomTypeChatController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      color: Colors.black.withOpacity(0.6),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller.messageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Type a message",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: controller.sendMessage,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
