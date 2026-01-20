import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:chat_app/view_model/after_login_controller/profile_controller/profile_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupProfilePage extends StatelessWidget {
  SetupProfilePage({super.key});

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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Edit Your Profile",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "This helps you match with\n the right people",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () => ctr.pickImage(),
                            child: Obx(
                              () => CircleAvatar(
                                radius: 45,
                                backgroundColor: const Color(0xffd46cff),
                                child: CircleAvatar(
                                  radius: 43,
                                  backgroundImage:
                                      ctr.selectedImage.value != null
                                      ? FileImage(
                                          ctr.selectedImage.value!,
                                        ) // 📷 picked image
                                      : const AssetImage(
                                              "assets/avatar/boy.png",
                                            )
                                            as ImageProvider, // 🌐 default image
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.mainColors, AppColors.graPurple1],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          _inputField("Enter your name", ctr.nameCtr),
                          _inputField("Enter your username", ctr.userNameCtr),
                          _inputField("Age", ctr.ageCtr),
                          _inputField("Gender", ctr.genderCtr),
                          _inputField("Address", ctr.locationCtr),

                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: AppColors.graPurple1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bio",
                                  style: textStyle15(
                                    FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                                AppTextField(
                                  controller: ctr.bioCtr,
                                  hint: "Looking for relationship!...",
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          // Interest
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: AppColors.graPurple1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Interest",
                                  style: textStyle15(
                                    FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                                AppTextField(
                                  controller: ctr.interestCtr,
                                  hint: "Looking for relationship!...",
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // LOOKING FOR
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.graPurple1.withAlpha(100),
                                  AppColors.gradientBlack.withAlpha(100),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Looking for:",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(
                                    ctr.lookingFor.length,
                                    (index) {
                                      final type = ctr.lookingFor[index];

                                      return Obx(() {
                                        final isSelected = ctr.selectedFor
                                            .contains(type);
                                        return GestureDetector(
                                          onTap: () {
                                            ctr.toggle(type);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColors.mainColors
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.white24,
                                              ),
                                            ),
                                            child: Text(
                                              type,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          // IMAGES
                          _uploadGrid(ctr),

                          const SizedBox(height: 24),

                          // SAVE BUTTON
                          Center(
                            child: CustomElevetedButton(
                              text: "Save Changes",
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
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

  Widget _inputField(String label, TextEditingController ctr) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle15(FontWeight.w600, color: AppColors.white54),
          ),
          SizedBox(height: 10),
          TextFieldWithBorder(controller: ctr),
        ],
      ),
    );
  }

  Widget _uploadGrid(ProfileEditController ctr) {
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
}
