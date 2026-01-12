import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SetupProfilePage extends StatelessWidget {
  const SetupProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.graPurple1,
              AppColors.gradientBlack.withAlpha(210),
              AppColors.gradientBlack.withAlpha(210),
              AppColors.gradientBlack.withAlpha(210),

              AppColors.gradientBlue.withAlpha(30),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 20,
                //   vertical: 16,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Set Up Your Profile",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "This helps you match with\n the right people",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 15,
                            top: 50,
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundColor: Color(0xffd46cff),
                              child: CircleAvatar(
                                radius: 43,
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=12",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.mainColors, AppColors.graPurple1],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          _inputField("Enter your name"),
                          _inputField("Age"),
                          _inputField("Gender"),
                          _inputField("Location"),

                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.gradientBlack,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: AppColors.white54,
                              ),
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
                                AppTextField(
                                  hint: "Looking for relationship!...",
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          // Interest
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.gradientBlack,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: AppColors.white54,
                              ),
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

                          const SizedBox(height: 12),

                          // LOOKING FOR
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.graPurple1.withAlpha(100),
                                  AppColors.gradientBlack.withAlpha(100),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Looking for:",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: const [
                                    _ChoiceChip(label: "Friends"),
                                    _ChoiceChip(label: "Relationship"),
                                    _ChoiceChip(label: "Casual Chat"),
                                    _ChoiceChip(label: "Fun"),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          // IMAGES
                          _uploadGrid(),

                          const SizedBox(height: 24),

                          // SAVE BUTTON
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: const Text(
                                "Save Changes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle15(FontWeight.w600, color: AppColors.white54),
          ),
          SizedBox(height: 10),
          TextField(
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.gradientBlack,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xffd46cff)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadGrid() {
    return Column(
      children: [
        const Text(
          "Upload 5-6 Pics for your Profile Pictures",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (_, __) => DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(10),
              borderPadding: EdgeInsets.all(2),
              color: AppColors.white54,
              gradient: LinearGradient(
                colors: [
                  AppColors.white54,
                  AppColors.graPurple1,
                  AppColors.graPurple2,
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.gradientBlack.withAlpha(100),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  const _ChoiceChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }
}
