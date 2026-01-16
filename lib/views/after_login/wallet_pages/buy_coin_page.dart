import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';

class BuyCoinsPage extends StatefulWidget {
  const BuyCoinsPage({super.key});

  @override
  State<BuyCoinsPage> createState() => _BuyCoinsPageState();
}

class _BuyCoinsPageState extends State<BuyCoinsPage> {
  int selectedPack = 0;
  int selectedPayment = 0;

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
              const Text(
                "Choose a pack",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(packs.length, (index) => _coinPackTile(index)),
              const SizedBox(height: 20),
              _paymentMethods(),
              const Spacer(),
              _payButton(),
            ],
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
              (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: _cardDecoration(),
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
