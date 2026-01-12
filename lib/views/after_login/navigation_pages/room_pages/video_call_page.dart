import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

  @override
  State<VideoCallPage> createState() => _StreamJoinPageState();
}

class _StreamJoinPageState extends State<VideoCallPage>
    with TickerProviderStateMixin {
  final List<_LikeItem> _likeItems = [];
  //final Random _random = Random();

  void _onLikeTap() {
    for (int i = 0; i < 4; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      );

      final item = _LikeItem(
        key: UniqueKey(),
        image: i.isEven ? "assets/icons/heart.png" : "assets/icons/gift.png",
        controller: controller,
        isEven: i.isEven,
      );

      _likeItems.add(item);

      controller.forward().then((_) {
        controller.dispose();
        setState(() => _likeItems.remove(item));
      });
    }

    setState(() {});
  }

  @override
  void dispose() {
    for (var item in _likeItems) {
      item.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Container(
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
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// LIVE STREAM CARD
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: mediaQuery.height * 0.70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      /// LIVE BADGE
                      Positioned(top: 10, right: 10, child: _liveBadge()),

                      /// USER INFO
                      Positioned(bottom: 10, left: 10, child: _userInfo()),

                      /// LIKE ANIMATION (BOTTOM RIGHT → MIDDLE)
                      ..._likeItems.map(
                        (item) => _LikeAnimation(
                          item: item,
                          cardHeight: mediaQuery.height * 0.70,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// ACTION BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _features(
                        "Ask to Join",
                        AppColors.white54,
                        Icons.add,
                        () {
                          //  Get.toNamed(AppRoutes.joinedStream);
                        },
                      ),
                      const SizedBox(width: 20),
                      _features(
                        "Like",
                        AppColors.red,
                        Icons.favorite,
                        _onLikeTap,
                      ),
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
        ],
      ),
    );
  }

  // ================= COMPONENTS =================

  Widget _liveBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.wifi_tethering, size: 15, color: AppColors.white),
          const SizedBox(width: 6),
          Text(
            "Live",
            style: textStyle12(FontWeight.w500, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Column(
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
            color: AppColors.mainColors.withAlpha(50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.remove_red_eye,
                size: 15,
                color: AppColors.white,
              ),
              const SizedBox(width: 6),
              Text(
                "125 views",
                style: textStyle12(FontWeight.w500, color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
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
}

class _LikeItem {
  final Key key;
  final String image;
  final bool isEven;
  final AnimationController controller;

  _LikeItem({
    required this.key,
    required this.image,
    required this.controller,
    required this.isEven,
  });
}

class _LikeAnimation extends StatelessWidget {
  final _LikeItem item;
  final double cardHeight;

  const _LikeAnimation({required this.item, required this.cardHeight});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: item.controller,
      builder: (_, __) {
        final progress = item.controller.value;

        return Positioned(
          bottom: 20 + (progress * cardHeight * 0.4),
          right: item.isEven ? 40 : 20,
          child: Opacity(
            opacity: 1 - progress,
            child: Image.asset(item.image, width: 40, height: 40),
          ),
        );
      },
    );
  }
}
