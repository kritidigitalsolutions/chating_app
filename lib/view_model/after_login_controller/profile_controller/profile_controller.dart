import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditController extends GetxController {
  final nameCtr = TextEditingController();
  final userNameCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final genderCtr = TextEditingController();
  final locationCtr = TextEditingController();
  final bioCtr = TextEditingController();
  final interestCtr = TextEditingController();

  // -------------------- image picker ----------------

  final ImagePicker picker = ImagePicker();

  final Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  //----------------- looking for -----------------
  //
  RxList<String> lookingFor = <String>[
    "Friends",
    "Relationship",
    "Casual Chat",
    "Fun",
  ].obs;

  RxList<String> selectedFor = <String>[].obs;

  void toggle(String type) {
    if (selectedFor.contains(type)) {
      selectedFor.remove(type);
    } else {
      selectedFor.add(type);
    }
  }

  //image pick for six slot

  RxList<File?> images = List<File?>.filled(6, null).obs;

  Future<void> pickSixImage(int index) async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked != null) {
      images[index] = File(picked.path);
    }
  }

  void remove(int index) {
    images[index] = null;
  }
}
