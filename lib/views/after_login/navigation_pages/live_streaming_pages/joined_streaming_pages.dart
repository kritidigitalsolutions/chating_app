import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';

class JoinedStreamingPages extends StatelessWidget {
  const JoinedStreamingPages({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// LIVE STREAM SECTION
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: _liveStreaming(isTop: true)),
                      Expanded(child: _liveStreaming(isTop: false)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ACTION BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _features("Like", AppColors.red, Icons.favorite, () {}),
                    const SizedBox(width: 20),
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

  // ================= FEATURES =================

  Widget _features(
    String label,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.graPurple1,
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: textStyle15(FontWeight.w500, color: AppColors.white54),
          ),
        ],
      ),
    );
  }

  // ================= LIVE STREAM CARD =================

  Widget _liveStreaming({required bool isTop}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isTop ? 15 : 0),
            topRight: Radius.circular(isTop ? 15 : 0),
            bottomLeft: Radius.circular(isTop ? 0 : 15),
            bottomRight: Radius.circular(isTop ? 0 : 15),
          ),
          child: Image.asset(
            "assets/images/image.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.gradientBlack,
                child: const Center(
                  child: Icon(Icons.image, color: AppColors.white, size: 40),
                ),
              );
            },
          ),
        ),

        /// LIVE BADGE
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.wifi_tethering,
                  size: 15,
                  color: AppColors.white,
                ),
                const SizedBox(width: 6),
                Text(
                  "Live",
                  style: textStyle12(FontWeight.w500, color: AppColors.white),
                ),
              ],
            ),
          ),
        ),

        /// USER INFO + VIEWERS
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amit",
                style: textStyle15(FontWeight.bold, color: AppColors.white),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.mainColors.withAlpha(60),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: AppColors.white,
                      size: 15,
                    ),
                    const SizedBox(width: 6),
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
    );
  }
}
