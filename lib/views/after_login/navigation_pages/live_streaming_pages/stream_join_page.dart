import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StreamJoinPage extends StatelessWidget {
  const StreamJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final medaiQuery = MediaQuery.of(context).size;
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
            child: Column(
              children: [
                SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: medaiQuery.height * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/image.png",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.image, color: AppColors.white),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.wifi_tethering,
                              size: 15,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Live",
                              style: textStyle12(
                                FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amit",
                            style: textStyle15(
                              FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColors.withAlpha(50),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "125 views",
                                  style: textStyle12(
                                    FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _features("Ask to Join", AppColors.white54, Icons.add, () {
                      Get.toNamed(AppRoutes.joinedStream);
                    }),
                    SizedBox(width: 20),
                    _features("Like", AppColors.red, Icons.favorite, () {}),
                    SizedBox(width: 20),
                    _features(
                      "Comment",
                      AppColors.white54,
                      Icons.chat_bubble_outline,
                      () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _features(
    String label,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.graPurple1,
            child: Icon(icon, color: color),
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: textStyle15(FontWeight.w500, color: AppColors.white54),
          ),
        ],
      ),
    );
  }
}
