import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/custom_snakebar.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/view_model/after_login_controller/wallet_controller/wallet_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class BuyCoinsPage extends StatefulWidget {
  const BuyCoinsPage({super.key});

  @override
  State<BuyCoinsPage> createState() => _BuyCoinsPageState();
}

class _BuyCoinsPageState extends State<BuyCoinsPage> {
  int selectedPack = 0;
  int selectedPayment = 0;

  final BuyCoinController ctr = Get.put(BuyCoinController());

  final List<Map<String, String>> packs = [
    {"coins": "50 Coins", "price": "₹25"},
    {"coins": "100 Coins", "price": "₹50"},
    {"coins": "250 Coins", "price": "₹125"},
    {"coins": "500 Coins", "price": "₹250"},
    {"coins": "1000 Coins", "price": "₹500"},
  ];

  final List<String> payments = ["UPI", "Cards", "Wallets"];

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BuyCoinsHeader(),
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
                RichText(
                  text: TextSpan(
                    style: textStyle24(FontWeight.bold, color: AppColors.white),
                    children: [
                      TextSpan(text: "Choose a "),
                      TextSpan(
                        text: "pack",
                        style: textStyle24(
                          FontWeight.bold,
                          color: AppColors.mainColors,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Text(
                //   "Choose a pack",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                const SizedBox(height: 16),
                ...List.generate(packs.length, (index) => _coinPackTile(index)),
                const SizedBox(height: 20),
                _paymentMethods(),
                const SizedBox(height: 40),
                _payButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _coinPackTile(int index) {
    final isSelected = selectedPack == index;

    return GestureDetector(
      onTap: () => setState(() => selectedPack = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 15, right: 15),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF7F3DFF), Color(0xFFB65CFF)],
                )
              : LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.02),
                  ],
                ),
          border: Border.all(color: Colors.purpleAccent.withOpacity(0.5)),
        ),
        child: Center(
          child: Text(
            "${packs[index]['coins']} - ${packs[index]['price']}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentMethods() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.02),
          ],
        ),
        border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Methods",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: List.generate(
              payments.length,
              (index) => Obx(() {
                final isSelected = ctr.selectedOption.value == payments[index];
                return GestureDetector(
                  onTap: () {
                    ctr.toggle(payments[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isSelected
                          ? AppColors.mainColors
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.purpleAccent.withOpacity(0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        payments[index],
                        style: textStyle15(
                          FontWeight.w500,
                          color: AppColors.white54,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _payButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          if (ctr.selectedOption.value == null ||
              ctr.selectedOption.value!.isEmpty) {
            showErrorSnackbar(
              title: "Oops!",
              message: "You need to choose a payment method before proceeding.",
            );
          } else {
            showSuccessSnackbar(
              title: "Done!",
              message: "Payment completed successfully 🎉",
            );
          }
        },
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
              "Proceed to Pay",
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

class BuyCoinsHeader extends StatelessWidget {
  const BuyCoinsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Buy Coins",
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
              color: AppColors.graPurple1,
            ),
            child: Image.asset(
              "assets/icons/dollar.png",
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}

/* ───────────────── COMMON CARD STYLE ───────────────── */

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [Colors.white.withOpacity(0.08), Colors.white.withOpacity(0.02)],
    ),
    border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
  );
}
