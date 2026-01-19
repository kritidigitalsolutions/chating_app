import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late PageController pageController;

  var currentIndex = 0.obs;

  var isRefreshing = false.obs;

  var chatList = <Map<String, String>>[
    {
      "name": "Ankita",
      "age": "19",
      "username": "@its_ankita",
      "image": "assets/images/couple-park.png",
      "distance": "4 KM",
      "des": "Looking for chat...",
      "status": "Active",
    },
    {
      "name": "Riya",
      "age": "21",
      "username": "@riya_21",
      "image": "assets/images/image.png",
      "distance": "2 KM",
      "des": "Looking for Relationship...",
      "status": "Online",
    },
    {
      "name": "Deepak",
      "age": "23",
      "username": "@deepak23",
      "image": "assets/images/user.jpg",
      "distance": "6 KM",
      "des": "Looking for Friends...",
      "status": "Active",
    },
  ].obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  /// NEXT CHAT (Group icon)
  void nextChat() {
    if (currentIndex.value < chatList.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }

    pageController.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// REFRESH (Shuffle profiles)
  Future<void> refreshChats() async {
    isRefreshing.value = true;

    await Future.delayed(const Duration(seconds: 1)); // simulate API

    chatList.shuffle();
    currentIndex.value = 0;
    pageController.jumpToPage(0);

    isRefreshing.value = false;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
