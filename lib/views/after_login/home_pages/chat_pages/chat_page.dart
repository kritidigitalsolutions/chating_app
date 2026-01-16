import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/chat_controller/chat_controller.dart';
import 'package:chat_app/views/before_login/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ChatController ctr = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/couple-park.png",
              fit: BoxFit.cover,
            ),
          ),

          backgroundGra(),
          SafeArea(
            child: Column(
              children: [
                _topBar(),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.graPurple2.withAlpha(150),
                        AppColors.graPurple1.withAlpha(150),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _actionChips(),
                SizedBox(height: 15),

                _chatList(),
                _messageInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────── TOP BAR ─────────
  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ankita 19",
                style: textStyle17(FontWeight.bold, color: AppColors.white),
              ),
              Text(
                "@its_ankita",
                style: textStyle14(FontWeight.bold, color: AppColors.white54),
              ),
            ],
          ),
          Spacer(),
          iconButton(Icons.call, AppColors.white, () {}),
          iconButton(Icons.video_call, AppColors.white, () {}),
          SizedBox(width: 8),
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage("assets/images/user.jpg"),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  // ───────── CHAT LIST ─────────
  Widget _chatList() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: ctr.messages.length,
          itemBuilder: (_, index) {
            final msg = ctr.messages[index];
            return ChatBubble(text: msg.message, isMe: msg.isMe);
          },
        ),
      ),
    );
  }

  // ───────── MESSAGE INPUT ─────────
  Widget _messageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          /// Camera Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white12,
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white70,
              size: 20,
            ),
          ),

          const SizedBox(width: 10),

          /// Text Field
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: ctr.messageController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: "Type a message",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// Send Button
          GestureDetector(
            onTap: ctr.sendMessage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff9B5CFF), Color(0xff5B9DFF)],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                "SEND",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _chip("Send Gifts", "assets/icons/gift.png", () {}),
            _chip("2 Coins Left", "assets/icons/dollar.png", () {
              Get.toNamed(AppRoutes.walletPage);
            }),
            _chip("Go Live", "assets/icons/video.png", () {
              Get.toNamed(AppRoutes.streamjoin);
            }),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColors.graPurple1.withAlpha(80),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: AppColors.white54),
        ),

        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.graPurple1,
              child: Image.asset(image),
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: textStyle13(FontWeight.w500, color: AppColors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundImage: isMe
                ? AssetImage('assets/images/user.jpg')
                : AssetImage('assets/images/image.png'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 260),
            decoration: BoxDecoration(
              color: isMe
                  ? AppColors.graPurple1.withOpacity(0.8)
                  : Colors.white12,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
