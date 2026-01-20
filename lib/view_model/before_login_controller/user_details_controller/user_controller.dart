import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum ProfileMode { realPhoto, avatar }

class ProfileDetailsController extends GetxController {
  final nameCtr = TextEditingController();
  final userNameCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final genderCtr = TextEditingController();
  final bioCtr = TextEditingController();

  final ImagePicker picker = ImagePicker();

  final Rx<ProfileMode?> selectedMode = Rx<ProfileMode?>(null);
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString selectedAvatar = ''.obs;

  RxBool showAge = true.obs;

  final List<String> avatars = [
    "assets/avatar/boy.png",
    "assets/avatar/girl.png",
    "assets/avatar/woman.png",
    "assets/avatar/one.png",
  ];

  void selectMode(ProfileMode mode) {
    selectedMode.value = mode;
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 70,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
      selectedAvatar.value = '';
      selectedMode.value = ProfileMode.realPhoto;
    }
  }

  void selectAvatar(String avatar) {
    selectedAvatar.value = avatar;
    selectedImage.value = null;
    selectedMode.value = ProfileMode.avatar;
  }

  bool isReady() {
    return selectedImage.value != null || selectedAvatar.value.isNotEmpty;
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

  String? validateTextFields() {
    if (nameCtr.text.trim().isEmpty) {
      return "Please enter your full name";
    }

    if (userNameCtr.text.trim().isEmpty) {
      return "Please enter a username";
    }

    if (ageCtr.text.trim().isEmpty) {
      return "Please enter your age";
    }

    final age = int.tryParse(ageCtr.text.trim());
    if (age == null) {
      return "Age must be a number";
    }

    if (age < 18) {
      return "You must be at least 18 years old";
    }

    if (genderCtr.text.trim().isEmpty) {
      return "Please enter your gender";
    }

    if (bioCtr.text.trim().isEmpty) {
      return "Please write a short bio";
    }

    return null; // ✅ All fields valid
  }

  bool isValid() {
    if (nameCtr.text.trim().isEmpty) return false;
    if (userNameCtr.text.trim().isEmpty) return false;
    if (ageCtr.text.trim().isEmpty) return false;
    if (genderCtr.text.trim().isEmpty) return false;

    return true;
  }
}
