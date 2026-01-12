import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikedProfilePage extends StatelessWidget {
  const LikedProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff5b2c83), Color(0xff0b0b1f), Color(0xff06202b)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.graPurple1,
                    AppColors.graPurple1,
                    AppColors.mainColors,
                  ],
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: "Who liked\nyour ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: "Profilile!",
                      style: TextStyle(color: Color(0xffd46cff)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const LikeCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LikeCard extends StatelessWidget {
  const LikeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.likedUserDetails);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [AppColors.graPurple1, AppColors.graPurple2],
          ),
        ),
        padding: const EdgeInsets.all(1.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.gradientBlack,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            leading: iconButton(Icons.favorite, Colors.pink, () {}),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  Vandana Singh ",
                  style: textStyle15(FontWeight.w600, color: AppColors.white),
                ),
                Text(
                  "liked you",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            subtitle: const Text(
              "Click to see the profile",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            trailing: Stack(
              alignment: Alignment.bottomRight,
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/user.jpg"),
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: AppColors.gradientBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
