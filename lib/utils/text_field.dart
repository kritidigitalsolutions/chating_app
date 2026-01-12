import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final Widget? suffix;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.suffix,
    this.maxLines = 1,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(width: 1, color: AppColors.white54)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters, // ✅ IMPORTANT
        cursorColor: AppColors.white54,
        readOnly: readOnly,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          //  hintText: hint,
          labelText: hint,
          labelStyle: textStyle15(FontWeight.w400, color: AppColors.white54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints(maxHeight: 40),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final bool readOnly;
  final Widget? suffix;

  const AppTextField({
    super.key,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      readOnly: readOnly,
      cursorColor: AppColors.white54,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: textStyle14(FontWeight.w400, color: AppColors.white54),
        border: InputBorder.none,
        isDense: true,
        suffixIcon: suffix,
      ),
    );
  }
}

class TextFieldWithBorder extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType keyboardType;
  final bool readOnly;
  final Widget? suffix;

  const TextFieldWithBorder({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.suffix,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.graPurple1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.graPurple1),
        ),
      ),
    );
  }
}
