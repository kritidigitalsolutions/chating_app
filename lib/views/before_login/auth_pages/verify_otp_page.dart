import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/custom_snakebar.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/before_login_controller/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(VerifyOtpController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3B1B4A), // purple top
              Color(0xFF0B0E17), // dark center
              Color(0xFF0F3A46), // teal bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Title
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Verify Your ",
                      style: textStyle30(
                        FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Code",
                      style: textStyle30(
                        FontWeight.w600,
                        color: AppColors.mainColors,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              /// Subtitle
              Text(
                "Enter the 4-digit code we just\nsent to your number",
                textAlign: TextAlign.center,
                style: textStyle14(FontWeight.w600, color: AppColors.white54),
              ),

              const SizedBox(height: 32),

              /// OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.graPurple1,
                        width: 1.2,
                      ),
                    ),
                    child: TextField(
                      controller: ctr.otpCtrls[index],
                      focusNode: ctr.focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: textStyle18(
                        FontWeight.w600,
                        color: AppColors.white,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => ctr.onOtpChanged(value, index),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Obx(
                () => ctr.errorText.value.isEmpty
                    ? const SizedBox()
                    : Text(
                        ctr.errorText.value,
                        style: textStyle12(
                          FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ),
              ),

              const SizedBox(height: 40),

              /// Continue Button
              gradientButton(
                width: 200,
                text: "Continue",
                onTap: () {
                  if (ctr.validateOtp()) {
                    showSuccessSnackbar(
                      title: "Success",
                      message: "OTP Verified",
                    );
                    Get.toNamed(AppRoutes.userImage);
                  }
                },
              ),

              const SizedBox(height: 80),

              /// Footer
              Text(
                "Terms of Service | Privacy Policy",
                style: textStyle11(FontWeight.w500, color: AppColors.white54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
