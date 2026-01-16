import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectRoomSpace extends StatelessWidget {
  const SelectRoomSpace({super.key});

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
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                // Top Header
                _topHeader(),

                SizedBox(height: 25),

                // list of chat, room
                _itemBox(
                  "Personal Rooms",
                  "space made just for you are your people",
                  '',
                  () {
                    Get.toNamed(AppRoutes.roomListPage);
                  },
                ),
                SizedBox(height: 15),
                _itemBox(
                  "Friends Room",
                  "space made just for you are your people",
                  '',
                  () {
                    Get.toNamed(AppRoutes.friendRoom);
                  },
                ),
                SizedBox(height: 15),
                // _itemBox(
                //   "Relationship Space",
                //   "space made just for you are your people",
                //   '',
                //   (){}
                // ),
                // SizedBox(height: 15),
                // _itemBox(
                //   "Casual Chat",
                //   "space made just for you are your people",
                //   '',
                //   (){}
                // ),
                // SizedBox(height: 15),
                // _itemBox(
                //   "Late Night Talks",
                //   "space made just for you are your people",
                //   '',
                //   (){}
                // ),
                // SizedBox(height: 15),
                // _itemBox(
                //   "Fun & Games",
                //   "space made just for you are your people",
                //   '',
                //   (){}
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Choose\nYour ",
                style: textStyle30(FontWeight.w500, color: AppColors.white),
              ),
              TextSpan(
                text: "Space",
                style: textStyle30(
                  FontWeight.w500,
                  color: AppColors.mainColors,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.roomCreate);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.graPurple1,
            child: Center(child: Icon(Icons.add, color: AppColors.white54)),
          ),
        ),
      ],
    );
  }

  Widget _itemBox(
    String title,
    String subtitle,
    String image,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.gradientBlack.withAlpha(100),
          border: Border.all(width: 1, color: AppColors.graPurple1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle15(FontWeight.w600, color: AppColors.white),
                ),
                Text(
                  subtitle,
                  style: textStyle13(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.chatPage);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: AppColors.graPurple1),
                    ),
                    child: Center(
                      child: Text(
                        'Enter Room',
                        style: textStyle12(
                          FontWeight.w400,
                          color: AppColors.white54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.graPurple1,
              child: Center(
                child: Image.asset(
                  image,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error_outline, color: AppColors.white54);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
