import 'dart:io';

import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileEditController ctr = Get.put(ProfileEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    iconButton(Icons.edit, AppColors.white, () {
                      Get.toNamed(AppRoutes.profileEdit);
                    }),
                  ],
                ),

                const SizedBox(height: 20),

                /// PROFILE IMAGE
                Center(
                  child: Obx(
                    () => CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.graPurple1,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: ctr.selectedImage.value != null
                            ? FileImage(ctr.selectedImage.value!)
                            : const AssetImage("assets/avatar/boy.png")
                                  as ImageProvider,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                /// NAME + USERNAME
                Center(
                  child: Column(
                    children: [
                      Text(
                        ctr.nameCtr.text.isEmpty
                            ? "Your Name"
                            : ctr.nameCtr.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ctr.userNameCtr.text.isEmpty
                            ? "@username"
                            : "@${ctr.userNameCtr.text}",
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// INFO CARD
                _infoCard(
                  title: "Basic Info",
                  child: Column(
                    children: [
                      _infoRow("Age", ctr.ageCtr.text),
                      _infoRow("Gender", ctr.genderCtr.text),
                      _infoRow("Address", ctr.locationCtr.text),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// BIO
                _infoCard(
                  title: "Bio",
                  child: Text(
                    ctr.bioCtr.text.isEmpty ? "No bio added" : ctr.bioCtr.text,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),

                const SizedBox(height: 16),

                /// INTEREST
                _infoCard(
                  title: "Interest",
                  child: Text(
                    ctr.interestCtr.text.isEmpty
                        ? "No interests added"
                        : ctr.interestCtr.text,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),

                const SizedBox(height: 16),

                /// LOOKING FOR
                _infoCard(
                  title: "Looking For",
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ctr.selectedFor
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColors,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                const SizedBox(height: 16),

                /// GALLERY
                _infoCard(
                  title: "Photos",
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ctr.images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemBuilder: (context, index) {
                      final File? img = ctr.images[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.05),
                        ),
                        child: img == null
                            ? const Icon(Icons.image, color: Colors.white24)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(img, fit: BoxFit.cover),
                              ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// EDIT BUTTON
                Center(
                  child: CustomElevetedButton(
                    text: "Edit Profile",
                    onPressed: () {
                      Get.toNamed(AppRoutes.profileEdit);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* ---------------- UI HELPERS ---------------- */

  Widget _infoCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white24),
        color: Colors.white.withOpacity(0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle15(FontWeight.w600, color: AppColors.white),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(color: Colors.white54, fontSize: 13),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? "-" : value,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
