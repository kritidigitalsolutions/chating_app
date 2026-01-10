import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Phone number page

class PhoneNumberController extends GetxController {
  final TextEditingController phoneCtr = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final RxString errorText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    /// Auto focus when page opens
    Future.delayed(const Duration(milliseconds: 300), () {
      focusNode.requestFocus();
    });
  }

  bool validatePhone() {
    if (phoneCtr.text.isEmpty) {
      errorText.value = "Phone number is required";
      return false;
    }

    if (phoneCtr.text.length != 10) {
      errorText.value = "Enter valid 10-digit number";
      return false;
    }

    errorText.value = '';
    return true;
  }
}

// Verify page

class VerifyOtpController extends GetxController {
  final List<TextEditingController> otpCtrls = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final RxString errorText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    /// Autofocus first box
    Future.delayed(const Duration(milliseconds: 300), () {
      focusNodes.first.requestFocus();
    });
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  bool validateOtp() {
    final otp = otpCtrls.map((e) => e.text).join();

    if (otp.length != 4) {
      errorText.value = "Enter valid 4-digit code";
      return false;
    }

    errorText.value = '';
    return true;
  }
}
