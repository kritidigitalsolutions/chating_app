import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:get/get.dart';

class UserImagePage extends StatelessWidget {
  const UserImagePage({super.key});

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
            colors: [Color(0xFF3B1B4A), Color(0xFF0B0E17), Color(0xFF0F3A46)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// TITLE
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Get ready to set\nup your ",
                      style: textStyle30(
                        FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: "profile!",
                      style: textStyle30(
                        FontWeight.w600,
                        color: AppColors.mainColors,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// REAL PHOTO MODE
              _profileOption(
                borderColor: AppColors.mainColors,
                avatar: CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage("assets/images/user.jpg"),
                ),
                text: "Real Photo Mode",
                onTap: () {
                  Get.toNamed(AppRoutes.userDetails, arguments: "PHOTO");
                },
              ),

              const SizedBox(height: 32),

              /// AVATAR MODE
              _profileOption(
                borderColor: AppColors.mainColors,
                avatar: CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage("assets/avatar/one.png"),
                ),
                text: "Real Photo Mode",
                onTap: () {
                  Get.toNamed(AppRoutes.userDetails, arguments: "AVATAR");
                },
              ),

              const Spacer(),

              /// FOOTER
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Terms of Service | Privacy Policy",
                  style: textStyle11(FontWeight.w500, color: AppColors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// PROFILE OPTION WIDGET
  Widget _profileOption({
    required Widget avatar,
    required String text,
    required Color borderColor,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent, width: 3),
            ),
            child: avatar,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 200,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white12,
            ),
            child: Center(
              child: Text(
                text,
                style: textStyle14(FontWeight.w600, color: AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
