import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/views/before_login/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  // final GoogleLoginController ctr = Get.put(GoogleLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/image.png", fit: BoxFit.cover),
          ),

          backgroundGra(),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in to continue",
                  style: textStyle18(FontWeight.bold, color: AppColors.white),
                ),
                SizedBox(height: 15),
                loginType(
                  "Login with Google",
                  "assets/images/google.png",
                  AppColors.mainColors.withAlpha(100),
                  () {
                    //await ctr.signInAndShowEmail();
                    Get.toNamed(AppRoutes.phoneNumber);
                  },
                ),
                SizedBox(height: 15),
                loginType(
                  "Login with Phone Number",
                  "assets/images/phone-call.png",
                  AppColors.mainColors.withAlpha(100),
                  () {
                    Get.toNamed(AppRoutes.phoneNumber);
                  },
                ),
                SizedBox(height: 30),

                oneLine(),
                SizedBox(height: 20),
                iconOnly(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Column(
              children: [
                Text(
                  "By continuing, you agree to your",
                  style: textStyle15(FontWeight.w500, color: AppColors.white),
                ),
                Text(
                  "Terms of Service | Privacy Policy",
                  style: textStyle13(FontWeight.w500, color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginType(
    String title,
    String image,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),

        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 18, height: 18),
            SizedBox(width: 10),
            Text(
              title,
              style: textStyle15(FontWeight.bold, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget oneLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 2,
          decoration: BoxDecoration(color: AppColors.white),
        ),
        SizedBox(width: 5),
        Text(
          "or sign to continue",
          style: textStyle15(FontWeight.w500, color: AppColors.white),
        ),
        SizedBox(width: 5),
        Container(
          width: 50,
          height: 2,
          decoration: BoxDecoration(color: AppColors.white),
        ),
      ],
    );
  }

  Widget iconOnly() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.facebook, color: AppColors.white),
        SizedBox(width: 12),
        Icon(FontAwesomeIcons.instagram, color: AppColors.white),
        SizedBox(width: 12),
        Icon(FontAwesomeIcons.x, color: AppColors.white),
        SizedBox(width: 12),
      ],
    );
  }
}
