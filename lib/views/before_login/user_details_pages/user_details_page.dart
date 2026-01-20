import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/custom_snakebar.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:chat_app/view_model/before_login_controller/user_details_controller/user_controller.dart';
import 'package:chat_app/views/before_login/custom_gradient.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({super.key});

  final data = Get.arguments;

  final ctr = Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: Image.asset(
              "assets/images/couple-park.png",
              fit: BoxFit.cover,
            ),
          ),

          backgroundGra(),

          /// Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _glassCard(context, ctr, data),
                  const SizedBox(height: 20),

                  _languageDropdown(),
                  const SizedBox(height: 16),
                  if (data == "PHOTO") _uploadGrid(ctr),
                  const SizedBox(height: 16),
                  gradientButton(
                    width: 200,
                    text: "Continue",
                    onTap: () {
                      final error = ctr.validateTextFields();

                      if (error != null) {
                        showErrorSnackbar(
                          title: "Invalid Details",
                          message: error,
                        );

                        return;
                      }

                      Get.toNamed(AppRoutes.homePage);
                    },
                  ),

                  const SizedBox(height: 10),
                  _termsText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Glass Card
  Widget _glassCard(
    BuildContext context,
    ProfileDetailsController ctr,
    String mode,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(2), // border thickness
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff9B5CFF).withAlpha(50),
              Color(0xff5B9DFF).withAlpha(50),
            ],
          ),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4), // 🔥 IMPORTANT
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              mode == "PHOTO"
                  ? _profileImage(ctr, mode)
                  : _AvatarImage(ctr, mode),
              const SizedBox(height: 16),
              CustomTextField(
                controller: ctr.nameCtr,
                hint: "Full Name",
                suffix: _greenChip("Show on Profile"),
              ),

              const SizedBox(height: 10),
              CustomTextField(controller: ctr.userNameCtr, hint: "Username"),
              const SizedBox(height: 10),
              Obx(
                () => CustomTextField(
                  controller: ctr.ageCtr,
                  hint: "Age",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ],
                  // Show the chip based on showAge state
                  suffix: GestureDetector(
                    onTap: () {
                      ctr.showAge.value =
                          !ctr.showAge.value; // toggle hide/show
                    },
                    child: _redChip(ctr.showAge.value ? "hide" : "show"),
                  ),
                  // Optionally mask the age if hidden
                  //  obscureText: !ctr.showAge.value,
                ),
              ),

              const SizedBox(height: 10),
              CustomTextField(controller: ctr.genderCtr, hint: "Gender"),

              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.white54, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Bio",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    TextField(
                      cursorColor: AppColors.white54,
                      controller: ctr.bioCtr,
                      maxLines: 3,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Looking for relationship",
                        hintStyle: textStyle14(
                          FontWeight.w400,
                          color: AppColors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage(ProfileDetailsController ctr, String mode) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showImagePicker(ctr);
          },
          child: Obx(() {
            return CircleAvatar(
              radius: 45,
              backgroundImage: ctr.selectedImage.value != null
                  ? FileImage(ctr.selectedImage.value!)
                  : const AssetImage("assets/images/user.jpg") as ImageProvider,
            );
          }),
        ),
        const SizedBox(height: 8),
        const Text(
          "Upload Your Profile Photo",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _AvatarImage(ProfileDetailsController ctr, String mode) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showAvatarPicker(ctr);
          },
          child: Obx(() {
            return CircleAvatar(
              radius: 45,
              backgroundImage: ctr.selectedAvatar.value.isNotEmpty
                  ? AssetImage(ctr.selectedAvatar.value)
                  : const AssetImage("assets/avatar/boy.png") as ImageProvider,
            );
          }),
        ),
        const SizedBox(height: 8),
        const Text(
          "Upload Your Avatar",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _greenChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _redChip(String text) {
    final isSelected = ctr.showAge.value;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.red : AppColors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.white, fontSize: 10),
      ),
    );
  }

  Widget _languageDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.white54),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Select Language", style: TextStyle(color: Colors.white70)),
          Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  /// Upload grid
  Widget _uploadGrid(ProfileDetailsController ctr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upload 5–6 Pics for your Profile Pictures",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => ctr.pickSixImage(index),
              child: Obx(
                () => Stack(
                  children: [
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: const Radius.circular(10),
                        borderPadding: const EdgeInsets.all(2),
                        color: AppColors.white54,
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.white54,
                            AppColors.graPurple1,
                            AppColors.graPurple2,
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.05),
                        ),
                        child: ctr.images[index] == null
                            ? const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white54,
                                  size: 28,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  ctr.images[index]!, // ✅ Rx accessed here
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                      ),
                    ),

                    if (ctr.images[index] != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: iconButton(Icons.close, AppColors.white54, () {
                          ctr.remove(index);
                        }),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _termsText() {
    return const Text(
      "Terms of Service | Privacy Policy",
      style: TextStyle(color: Colors.white54, fontSize: 11),
    );
  }
}

// IMAGE PICKER
void _showImagePicker(ProfileDetailsController ctr) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.white),
            title: const Text("Camera", style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.back();
              ctr.pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.white),
            title: const Text("Gallery", style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.back();
              ctr.pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    ),
  );
}

/// AVATAR PICKER (CUSTOM)
void _showAvatarPicker(ProfileDetailsController ctr) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Choose Avatar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            itemCount: ctr.avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (_, index) {
              final avatar = ctr.avatars[index];
              return GestureDetector(
                onTap: () {
                  ctr.selectAvatar(avatar);
                  Get.back();
                },
                child: CircleAvatar(backgroundImage: AssetImage(avatar)),
              );
            },
          ),
        ],
      ),
    ),
  );
}
