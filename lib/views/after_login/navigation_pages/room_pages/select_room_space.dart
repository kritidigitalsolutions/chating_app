import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/room_controller/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectRoomSpace extends StatelessWidget {
  SelectRoomSpace({super.key});

  final RoomCreatingController ctr = Get.isRegistered<RoomCreatingController>()
      ? Get.find<RoomCreatingController>()
      : Get.put(RoomCreatingController());

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
                  "assets/room/user.png",
                  () {
                    Get.toNamed(AppRoutes.roomListPage);
                  },
                ),
                SizedBox(height: 15),
                _itemBox(
                  "Friends Room",
                  "space made just for you are your people",
                  "assets/room/support.png",
                  () {
                    Get.toNamed(AppRoutes.friendRoom);
                  },
                ),
                SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ctr.roomList.length,
                  itemBuilder: (context, index) {
                    final room = ctr.roomList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: _itemBox(
                        room.roomType,
                        room.roomDes,
                        roomType(room.roomType),
                        () {
                          Get.toNamed(AppRoutes.friendRoom);
                        },
                      ),
                    );
                  },
                ),
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
              ],
            ),

            Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.graPurple1,
              child: Image.asset(
                image,
                width: 45,
                height: 45,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error_outline, color: AppColors.white54);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String roomType(String type) {
  switch (type) {
    case "Friends":
      return "assets/room/support.png";
    case "Relationships":
      return "assets/room/in-love.png";
    case "Casual Chat":
      return "assets/room/bubble-chat.png";
    case "Late Night Talks":
      return "assets/room/moon.png";
    case "Fun & Games":
      return "assets/room/ball-pit.png";
    default:
      return "assets/room/user.png";
  }
}
