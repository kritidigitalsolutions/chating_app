import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [iconButton(Icons.help, AppColors.white54, () {})],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _itemIBox(
                              "Filter",
                              Icon(Icons.filter_alt, color: AppColors.white54),
                            ),
                            SizedBox(width: 10),
                            _itemIBox(
                              "Radio",
                              Icon(Icons.radio, color: AppColors.white54),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            _itemIBox("Nearby", null),
                            SizedBox(width: 10),
                            _itemIBox("Global", null),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(),
                  ],
                ),
                SizedBox(height: 25),

                // main body
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.contactPage);
                  },
                  child: _chatBox(mediaQuery),
                ),
                SizedBox(height: 25),

                // feature icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    featureIcon("assets/icons/refresh.png", () {}),
                    featureIcon("assets/icons/Group.png", () {}),
                    featureIcon("assets/icons/heart.png", () {}),
                    featureIcon("assets/icons/bubble-chat.png", () {}),
                    featureIcon("assets/icons/bookmark.png", () {}),
                  ],
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [AppColors.graPurple1, AppColors.graPurple2],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _navigationItem("assets/icons/room.png", () {}),
                      _navigationItem("assets/icons/antenna.png", () {}),
                      _navigationItem("assets/icons/user.png", () {}),
                      _navigationItem("assets/icons/heart_white.png", () {}),
                      _navigationItem("assets/icons/bubble-chat.png", () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemIBox(String text, Widget? icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.white54),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: textStyle14(FontWeight.w500, color: AppColors.white54),
            ),
            SizedBox(width: 5),
            icon ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _chatBox(Size size) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage("assets/images/couple-park.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // top body
          Row(
            children: [
              Card(
                color: AppColors.white.withAlpha(100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 2),
                      Text(
                        "4 KM",
                        style: textStyle13(
                          FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              _boxLable("Active", AppColors.green),
            ],
          ),
          Spacer(),
          // Bottom body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ankita 19",
                style: textStyle30(FontWeight.bold, color: AppColors.white),
              ),
              Text(
                "@its_ankita",
                style: textStyle24(FontWeight.bold, color: AppColors.white54),
              ),
              Row(
                children: [
                  Text(
                    "Looking for relationship!...",
                    style: textStyle14(
                      FontWeight.w600,
                      color: AppColors.white54,
                    ),
                  ),
                  Spacer(),
                  _boxLable("See Profile", AppColors.graPurple1),
                ],
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

  // feature

  Widget featureIcon(String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.graPurple1,
        child: Image.asset(image),
      ),
    );
  }

  Widget _navigationItem(String image, VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: Image.asset(image));
  }
}
