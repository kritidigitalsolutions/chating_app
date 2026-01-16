import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 30,
    this.backgroundColor = AppColors.mainColors,
    this.textColor = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 6,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class CustomElevetedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomElevetedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 30,
    this.backgroundColor = AppColors.graPurple1,
    this.textColor = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 6,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}

Widget gradientButton({
  required double width,
  required String text,
  required VoidCallback onTap,
  double height = 48,
  FontWeight fontWeight = FontWeight.w600,
  Color color = AppColors.white,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [AppColors.graPurple1, AppColors.graPurple2],
        ),
      ),
      child: Center(
        child: Text(text, style: textStyle15(FontWeight.w600, color: color)),
      ),
    ),
  );
}

Widget iconButton(IconData icon, Color color, VoidCallback onTap) {
  return IconButton(
    onPressed: onTap,
    icon: Icon(icon, color: color),
  );
}
