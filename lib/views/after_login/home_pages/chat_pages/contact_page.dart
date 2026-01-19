import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(data);
    final mediaQuery = MediaQuery.of(context).size;
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // user details
                  _userDetails(mediaQuery, data),
                  SizedBox(height: 15),
                  // Bio
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.graPurple1.withAlpha(20),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: AppColors.white54),
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
                        AppTextField(hint: data["des"], maxLines: 4),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  // Interest
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.graPurple1.withAlpha(20),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: AppColors.white54),
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
                          hint: "Looking for relationship!...",
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.graPurple2,
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.graPurple1,
                              child: Image.asset(
                                "assets/icons/gift.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Send Gifts",
                              style: textStyle13(
                                FontWeight.w500,
                                color: AppColors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _userDetails(Size size, Map<String, dynamic> user) {
    return Container(
      height: size.height * 0.4,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.graPurple1.withAlpha(20),
        border: Border.all(width: 1, color: AppColors.white54),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 5 / 3.5,
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: AppColors.white54),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(user["image"], fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: _boxLable(user["status"], AppColors.green),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.graPurple1,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "${user["name"]} ${user["age"]}",
                    style: textStyle15(FontWeight.bold, color: AppColors.white),
                  ),
                  Text(
                    "${user["username"]}",
                    style: textStyle13(
                      FontWeight.bold,
                      color: AppColors.white54,
                    ),
                  ),
                ],
              ),
              Spacer(),
              _callType(Icons.call, AppColors.white, () {}),
              SizedBox(width: 5),
              _callType(Icons.video_call, AppColors.white, () {}),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.chatPage);
                },
                child: Card(
                  color: AppColors.graPurple2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 3,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/bubble-chat.png',
                          width: 22,
                          height: 22,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Chat",
                          style: textStyle13(
                            FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxLable(String text, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: Center(
          child: Text(
            text,
            style: textStyle13(FontWeight.w500, color: AppColors.white),
          ),
        ),
      ),
    );
  }

  Widget _callType(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.graPurple1,
        child: Icon(icon, color: color),
      ),
    );
  }
}
