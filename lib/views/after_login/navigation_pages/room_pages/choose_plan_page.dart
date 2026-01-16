import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/custom_snakebar.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/room_controller/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoosePlanPage extends StatelessWidget {
  ChoosePlanPage({super.key});

  final ChoosePlanController planCtl = Get.put(ChoosePlanController());

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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Choose the",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Plan",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFFB65CFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    children: [
                      PlanCard(
                        title: "Premium Events &\nStreams",
                        price: "199",
                        ctr: planCtl,
                        plan: "BASIC",
                        features: [
                          "Access exclusive live events and premium streams",
                          "Ad-free, high-quality streaming",
                          "Watch replays anytime",
                        ],
                      ),
                      SizedBox(height: 16),
                      PlanCard(
                        title: "One-on-One Sessions\nwith Creators",
                        price: "299",
                        ctr: planCtl,
                        plan: "PRO",
                        features: [
                          "Private 1:1 video or audio sessions with creators",
                          "Flexible scheduling based on availability",
                          "Secure and confidential interaction",
                          "Session recordings (if permitted)",
                        ],
                      ),
                    ],
                  ),
                ),
                gradientButton(
                  width: double.infinity,
                  text: "Confirm",
                  onTap: () {
                    if (planCtl.plan.value == null ||
                        planCtl.plan.value!.isEmpty) {
                      showErrorSnackbar(
                        title: "Plan",
                        message: "Please select your plan",
                      );
                      return;
                    }

                    showSuccessSnackbar(
                      title: "Plan",
                      message: "Your plan has been purchased successfully.",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final ChoosePlanController ctr;
  final String plan;
  final List<String> features;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.ctr,
    required this.plan,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = ctr.plan.value == plan;

      return AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isSelected ? 1.03 : 1.0,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => ctr.toggel(plan),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: isSelected
                        ? [
                            AppColors.graPurple1.withOpacity(0.35),
                            AppColors.graPurple1.withOpacity(0.15),
                          ]
                        : [
                            Colors.white.withOpacity(0.08),
                            Colors.white.withOpacity(0.02),
                          ],
                  ),
                  border: Border.all(
                    color: isSelected ? AppColors.green : AppColors.graPurple1,
                    width: isSelected ? 1.6 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: const Icon(
                            Icons.workspace_premium,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    /// FEATURES
                    ...features.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Icon(
                                Icons.circle,
                                size: 6,
                                color: Colors.greenAccent,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                e,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// PRICE
                    Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee,
                          size: 16,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          price,
                          style: textStyle17(
                            FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// CHECK ICON
            if (isSelected)
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.green,
                  size: 22,
                ),
              ),

            /// SELECTED BADGE
            if (isSelected)
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "SELECTED",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
