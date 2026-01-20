import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/home_controller/home_controller.dart';
import 'package:chat_app/views/after_login/home_pages/home/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => const OfferDialog(),
      );
    });
  }

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
                  children: [
                    iconButton(Icons.help, AppColors.white54, () {
                      Get.toNamed(AppRoutes.helpPage);
                    }),
                  ],
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
                              () {
                                _openFilterSheet(context);
                              },
                            ),
                            SizedBox(width: 10),
                            _itemIBox(
                              "Radio",
                              Icon(Icons.radio, color: AppColors.white54),
                              () {
                                Get.toNamed(AppRoutes.liveRadio);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            _itemIBox("Nearby", null, () {}),
                            SizedBox(width: 10),
                            _itemIBox("Global", null, () {}),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.profilePage);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/user.jpg"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                // main body
                SizedBox(
                  height: mediaQuery.height * 0.5,
                  child: Stack(
                    children: [
                      /// CHAT PAGES
                      Obx(
                        () => PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.chatList.length,
                          onPageChanged: controller.currentIndex.call,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.contactPage,
                                  arguments: controller.chatList[index],
                                );
                              },
                              child: _chatBox(
                                mediaQuery,
                                controller.chatList[index],
                              ),
                            );
                          },
                        ),
                      ),

                      /// LOADER OVERLAY
                      Obx(
                        () => controller.isRefreshing.value
                            ? Container(
                                color: Colors.black.withOpacity(0.4),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // feature icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// REFRESH
                    // featureIcon("assets/icons/refresh.png", () {
                    //   controller.refreshChats();
                    // }),

                    // /// NEXT CHAT
                    // featureIcon("assets/icons/Group.png", () {
                    //   controller.nextChat();
                    // }),
                    // featureIcon("assets/icons/heart.png", () {}),
                    // featureIcon("assets/icons/bubble-chat.png", () {
                    //   Get.toNamed(AppRoutes.chatPage);
                    // }),
                    // featureIcon("assets/icons/bookmark.png", () {}),
                    featureIcon(Icons.refresh_outlined, () {
                      controller.refreshChats();
                    }),

                    /// NEXT CHAT
                    featureIcon(Icons.close, () {
                      controller.nextChat();
                    }),
                    featureIcon(Icons.favorite, () {}, color: AppColors.red),
                    featureIcon(Icons.chat, () {
                      Get.toNamed(AppRoutes.chatPage);
                    }),
                    featureIcon(Icons.bookmark, () {}),
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
                      _navigationItem("assets/icons/room.png", () {
                        Get.toNamed(AppRoutes.roomSpace);
                      }),
                      _navigationItem("assets/icons/antenna.png", () {
                        Get.toNamed(AppRoutes.streamingList);
                      }),
                      _navigationItem("assets/icons/user.png", () {
                        Get.toNamed(AppRoutes.profilePage);
                      }),
                      _navigationItem("assets/icons/heart.png", () {
                        Get.toNamed(AppRoutes.likedProfile);
                      }),
                      _navigationItem("assets/icons/bubble-chat.png", () {
                        Get.toNamed(AppRoutes.chatList);
                      }),
                      // _navigationItem(Icons.room_service_outlined, () {
                      //   Get.toNamed(AppRoutes.roomSpace);
                      // }),
                      // _navigationItem(Icons.stream_outlined, () {
                      //   Get.toNamed(AppRoutes.streamingList);
                      // }),
                      // _navigationItem(FontAwesomeIcons.person, () {
                      //   Get.toNamed(AppRoutes.profilePage);
                      // }),
                      // _navigationItem(Icons.favorite, () {
                      //   Get.toNamed(AppRoutes.likedProfile);
                      // }),
                      // _navigationItem(Icons.chat_bubble_outline, () {
                      //   Get.toNamed(AppRoutes.chatList);
                      // }),
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

  Widget _itemIBox(String text, Widget? icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget _chatBox(Size size, Map<String, String> data) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(data["image"] ?? ''),
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
                        data["distance"] ?? '',
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
              _boxLable(data["status"] ?? '', AppColors.green),
            ],
          ),
          Spacer(),
          // Bottom body
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${data["name"]} ${data["age"]}",
                style: textStyle30(FontWeight.bold, color: AppColors.white),
              ),
              Text(
                data["username"] ?? '',
                style: textStyle24(FontWeight.bold, color: AppColors.white54),
              ),
              Row(
                children: [
                  Text(
                    data["des"] ?? '',
                    style: textStyle14(
                      FontWeight.w600,
                      color: AppColors.white54,
                    ),
                  ),
                  Spacer(),
                  _boxLable("See Profile", AppColors.mainColors),
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

  // Widget featureIcon(String image, VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: CircleAvatar(
  //       radius: 25,
  //       backgroundColor: AppColors.graPurple1,
  //       child: Image.asset(image),
  //     ),
  //   );
  // }

  Widget featureIcon(
    IconData icon,
    VoidCallback onTap, {
    Color color = AppColors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.graPurple1,
        child: Icon(icon, color: color, size: 23),
      ),
    );
  }

  Widget _navigationItem(String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        width: 25,
        height: 25,
        // ignore: deprecated_member_use
        color: AppColors.white,
      ),
    );
  }

  // Widget _navigationItem(IconData icon, VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Icon(icon, size: 25, color: AppColors.white),
  //   );
  // }
}

class OfferDialog extends StatelessWidget {
  const OfferDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const RadialGradient(
            center: Alignment.topLeft,
            radius: 1.2,
            colors: [
              AppColors.graPurple1,
              AppColors.gradientBlack,
              AppColors.balckBlue,
            ],
          ),
        ),
        child: Stack(
          children: [
            /// CLOSE BUTTON
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white54),
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// LIMITED DEAL
                  Text(
                    "LIMITED TIME DEAL 💖",

                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 3,
                      color: AppColors.white,
                    ),
                  ),

                  /// FLAT OFF
                  Text(
                    "Flat 80% OFF",
                    style: textStyle18(FontWeight.bold, color: Colors.white),
                  ),

                  const SizedBox(height: 10),

                  /// SUBTITLE
                  Text(
                    "Boost your chances\nto meet new people in",
                    textAlign: TextAlign.center,
                    style: textStyle14(FontWeight.w400, color: Colors.white70),
                  ),

                  const SizedBox(height: 8),

                  /// 2026 TEXT
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF9C6BFF), Color(0xFF3EC5FF)],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      "2026!",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// PRICE INFO
                  Text(
                    "100 Coins worth",
                    style: textStyle13(FontWeight.w400, color: Colors.white70),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹100",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "₹20 Only",
                        style: textStyle14(
                          FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _openFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.transparent,
    builder: (_) => const FilterBottomSheet(),
  );
}
