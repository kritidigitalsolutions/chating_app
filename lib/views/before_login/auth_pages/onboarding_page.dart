import 'dart:math' as math;

import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/views/before_login/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/image.png", fit: BoxFit.cover),
          ),
          //  Positioned.fill(child: Container(color: Colors.black.withOpacity(2))),
          backgroundGra(),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circular rings
                _circleRing(300),
                _circleRing(480),

                _circleRing(800),

                // Profile images
                _profileAvatar(top: 80, right: 40),
                _profileAvatar(top: 160, left: 40),
                _profileAvatar(bottom: 140, right: 40),
                _profileAvatar(bottom: 80, left: 40),

                // Center content
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Find Your",
                      style: textStyle30(
                        FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Partner!",
                      style: textStyle50(
                        color: Color(0xFF2ED1FF),
                        FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: "Get Started",
                      onPressed: () {
                        Get.toNamed(AppRoutes.loginPage);
                      },
                      width: 200,
                      borderRadius: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Circular ring widget
  Widget _circleRing(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
    );
  }

  Widget fullWidthHalfRing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return CustomPaint(
      size: Size(width, width / 2),
      painter: FullWidthHalfRingPainter(
        color: Colors.white.withOpacity(0.15),
        strokeWidth: 1,
      ),
    );
  }

  // Profile avatar widget
  Widget _profileAvatar({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.white,
        child: const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            "https://randomuser.me/api/portraits/men/32.jpg",
          ),
        ),
      ),
    );
  }
}

class FullWidthHalfRingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  FullWidthHalfRingPainter({required this.color, this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final radius = size.width / 2;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: radius,
    );

    canvas.drawArc(
      rect,
      math.pi, // 180°
      math.pi, // 180°
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
