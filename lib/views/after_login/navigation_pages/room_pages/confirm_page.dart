import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),

                /// TITLE
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Start interacting\n",
                        style: textStyle30(
                          FontWeight.bold,
                          color: AppColors.mainColors,
                        ),
                      ),
                      TextSpan(
                        text: "with people!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                /// PROFILE CARD
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: mediaQuery.width * 0.7,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.graPurple1,
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.08),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          /// AVATAR
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              "assets/images/user.jpg",
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// NAME
                          const Text(
                            "Vikrant ( Room )",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 4),

                          /// TAG
                          const Text(
                            "| Casual Chat |",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// DESCRIPTION
                          const Text(
                            "Hi Guys this is vikrant, you will\nget full vibe here with me",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white60,
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// ACTION ICONS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _actionIcon(Icons.videocam),
                              _actionIcon(Icons.call),
                              _actionIcon(Icons.chat),
                              _actionIcon(Icons.add),
                            ],
                          ),

                          const SizedBox(height: 16),

                          /// WALLET BUTTON
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6A1B9A), Color(0xFF8E44AD)],
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "My Wallet",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// STAR BADGE
                    Positioned(
                      right: -8,
                      top: -8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.orange,
                        child: const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
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

  /// ACTION ICON
  static Widget _actionIcon(IconData icon) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.videoCallPage);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.graPurple1,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.mainColors),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
