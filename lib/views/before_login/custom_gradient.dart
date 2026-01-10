import 'package:chat_app/res/app_colors.dart';
import 'package:flutter/material.dart';

Widget backgroundGra() {
  return Positioned.fill(
    child: Container(
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
    ),
  );
}
