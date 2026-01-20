import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/before_login_controller/auth_controller/auth_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(PhoneNumberController());
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
              Text(
                "Enter your",
                style: textStyle30(FontWeight.w600, color: AppColors.white),
              ),

              Text(
                "Phone Number",
                style: textStyle30(
                  FontWeight.w600,
                  color: AppColors.mainColors,
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            ctr.countryCode.value =
                                "${country.flagEmoji} +${country.phoneCode}";
                          },
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.graPurple1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => Center(
                            child: Text(
                              ctr.countryCode.value,
                              style: textStyle14(
                                FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: AppColors.graPurple1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: ctr.phoneCtr,
                          focusNode: ctr.focusNode,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: textStyle15(
                            FontWeight.w600,
                            color: AppColors.white,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Enter Phone Number",
                            hintStyle: textStyle14(
                              FontWeight.w500,
                              color: AppColors.white54,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              Obx(
                () => ctr.errorText.value.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ctr.errorText.value,
                            style: textStyle12(
                              FontWeight.w500,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
              ),

              const SizedBox(height: 40),

              /// Continue Button
              ///
              gradientButton(
                width: 200,
                text: "Continue",
                onTap: () {
                  if (ctr.validatePhone()) {
                    Get.toNamed(AppRoutes.verifyOtp);
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
