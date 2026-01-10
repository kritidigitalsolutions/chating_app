import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum ProfileMode { realPhoto, avatar }

class ProfileDetailsController extends GetxController {
  final ImagePicker picker = ImagePicker();

  final Rx<ProfileMode?> selectedMode = Rx<ProfileMode?>(null);
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString selectedAvatar = ''.obs;

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
}
