import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class ConvertCoinsPage extends StatefulWidget {
  const ConvertCoinsPage({super.key});

  @override
  State<ConvertCoinsPage> createState() => _ConvertCoinsPageState();
}

class _ConvertCoinsPageState extends State<ConvertCoinsPage> {
  int selectedMethod = 0;

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
          child: Column(
            children: [
              const ConvertHeader(),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.graPurple2, AppColors.graPurple1],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const BalanceCard(),
              const SizedBox(height: 16),
              _paymentCard(),
              const Spacer(),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Payment Method",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            children: List.generate(
              paymentMethods.length,
              (index) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.graPurple1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    paymentMethods[index],
                    style: textStyle15(
                      FontWeight.w500,
                      color: AppColors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7F3DFF), Color(0xFFB65CFF)],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              "Confirm Cashout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ───────────────── HEADER ───────────────── */

class ConvertHeader extends StatelessWidget {
  const ConvertHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Convert\nCoins",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFFFC107), Color(0xFFFF9800)],
              ),
            ),
            child: const Icon(Icons.monetization_on, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/* ───────────────── BALANCE CARD ───────────────── */

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Text(
            "Balance Card",
            style: textStyle17(FontWeight.w600, color: AppColors.white),
          ),
          SizedBox(height: 8),
          Text(
            "Available Coins |  7,850 Coins",
            style: textStyle14(FontWeight.w600, color: AppColors.white54),
          ),
          SizedBox(height: 4),
          Text(
            "Estimated Earnings |  ₹4,950.50",
            style: textStyle12(FontWeight.w600, color: AppColors.white54),
          ),
          const SizedBox(height: 16),
          Text(
            "Enter Coins to Convert",
            style: textStyle15(FontWeight.w400, color: AppColors.white),
          ),
          const SizedBox(height: 10),
          SizedBox(width: 220, child: TextFieldWithBorder()),
          const SizedBox(height: 14),
          Text(
            "You Will Receive",
            style: textStyle14(FontWeight.w400, color: AppColors.white),
          ),
          const SizedBox(height: 8),
          SizedBox(width: 220, child: TextFieldWithBorder()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/* ───────────────── CONSTANTS ───────────────── */

const List<String> paymentMethods = [
  "UPI",
  "Paytm",
  "PhonePe",
  "Bank Transfer",
];

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [Colors.white.withOpacity(0.08), Colors.white.withOpacity(0.02)],
    ),
    border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
  );
}
