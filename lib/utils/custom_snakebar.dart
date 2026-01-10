import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// SUCCESS SNACKBAR
void showSuccessSnackbar({required String title, required String message}) {
  _showSnackbar(
    title: title,
    message: message,
    icon: Icons.check_circle,
    gradientColors: const [Color(0xFF2ECC71), Color(0xFF27AE60)],
  );
}

/// ERROR SNACKBAR
void showErrorSnackbar({required String title, required String message}) {
  _showSnackbar(
    title: title,
    message: message,
    icon: Icons.error,
    gradientColors: const [Color(0xFFE74C3C), Color(0xFFC0392B)],
  );
}

/// COMMON SNACKBAR METHOD
void _showSnackbar({
  required String title,
  required String message,
  required IconData icon,
  required List<Color> gradientColors,
}) {
  Get.rawSnackbar(
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    borderRadius: 12,
    duration: const Duration(seconds: 3),
    messageText: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: gradientColors),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
