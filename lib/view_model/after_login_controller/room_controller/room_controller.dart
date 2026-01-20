import 'package:chat_app/model/request_model/room_create_request_model.dart';
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

  var selectedImage = RxnString();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = image.path;
    }
  }

  final TextEditingController roomName = TextEditingController();
  final TextEditingController roomDescription = TextEditingController();

  // Selections
  final selectedRoomType = ''.obs;
  final roomPrivacy = ''.obs; // public / private
  final entryType = ''.obs; // free / paid
  final participantLimit = ''.obs;

  // Validation
  bool validateRoom() {
    if (roomName.text.trim().isEmpty) {
      Get.snackbar("Error", "Room name is required");
      return false;
    }
    if (selectedRoomType.value.isEmpty) {
      Get.snackbar("Error", "Please select room type");
      return false;
    }
    if (roomPrivacy.value.isEmpty) {
      Get.snackbar("Error", "Please select room privacy");
      return false;
    }
    if (entryType.value.isEmpty) {
      Get.snackbar("Error", "Please select entry type");
      return false;
    }
    if (participantLimit.value.isEmpty) {
      Get.snackbar("Error", "Please select participant limit");
      return false;
    }
    return true;
  }

  RxList<RoomCreateRequestModel> roomList = <RoomCreateRequestModel>[].obs;

  void save(RoomCreateRequestModel model) {
    roomList.add(model);
  }
}
