import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/res/app_colors.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topBar(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.graPurple2, AppColors.graPurple1],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _actionRow(),
                const SizedBox(height: 16),
                _walletSummary(),
                const SizedBox(height: 16),
                _lifetimeOverview(),
                const SizedBox(height: 16),
                _liveStreamEarning(),
                const SizedBox(height: 16),
                _transactionHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ───────── TOP BAR ─────────
  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "My Wallet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white12,

            child: Image.asset(
              "assets/icons/wallet.png",
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }

  // ───────── ACTION ICONS ─────────
  Widget _actionRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconItem("assets/icons/gift-box.png", "Gift Sent", () {}),
          _iconItem("assets/icons/video-camera.png", "Video Call", () {}),
          _iconItem("assets/icons/dollar.png", "Coins History", () {
            Get.toNamed(AppRoutes.coinHistory);
          }),
          _iconItem("assets/icons/live.png", "Live Streaming", () {}),
        ],
      ),
    );
  }

  Widget _iconItem(String image, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.graPurple1,
            child: Image.asset(image, width: 25, height: 25),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }

  // ───────── WALLET SUMMARY ─────────
  Widget _walletSummary() {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader("Wallet Summary"),
          const SizedBox(height: 6),
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Image.asset("assets/icons/dollar.png", width: 20, height: 20),

              SizedBox(width: 6),
              Text(
                "2 Coins",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ───────── LIFETIME OVERVIEW ─────────
  Widget _lifetimeOverview() {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardHeader("Lifetime Overview"),
          const SizedBox(height: 10),
          _coinRow("Coins Purchased", "120 Coins"),
          _coinRow("Coins Earned", "69 Coins"),
          _coinRow("Coins Spent", "150 Coins"),
        ],
      ),
    );
  }

  Widget _coinRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          _coinChip(value),
        ],
      ),
    );
  }

  Widget _coinChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white12,
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/dollar.png", width: 18, height: 18),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }

  // ───────── LIVE STREAM EARNING ─────────
  Widget _liveStreamEarning() {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/video-camera.png",
                width: 25,
                height: 25,
              ),
              SizedBox(width: 10),
              Text(
                "Live Stream Earning",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: AppColors.white54),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/dollar.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "16 Coins",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _gradientButton("Convert Coins"),
            ],
          ),
        ],
      ),
    );
  }

  // ───────── TRANSACTION HISTORY ─────────
  Widget _transactionHistory() {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/icons/history.png", width: 25, height: 25),
              SizedBox(width: 10),
              Text(
                "Transaction History",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          _transactionItem("Sent Gift to Ankita", "-5 Coins"),
          _transactionItem("Video Call with Ritu", "-10 Coins"),
          _transactionItem("Coin Purchase", "+50 Coins"),
          _transactionItem("Live Stream Earning", "+15 Coins"),
          Center(
            child: textButton("Explore More", AppColors.mainColors, () {
              Get.toNamed(AppRoutes.transactionHistroyPage);
            }),
          ),
        ],
      ),
    );
  }

  Widget _transactionItem(String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.graPurple1.withAlpha(50),
        border: Border.all(width: 1, color: AppColors.graPurple1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColors.white54, fontSize: 12),
          ),
          Column(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Wed 12",
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ───────── COMMON UI ─────────
  Widget _glassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.graPurple1.withAlpha(20),
        border: Border.all(color: AppColors.graPurple1),
      ),
      child: child,
    );
  }

  Widget _cardHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.more_horiz, color: Colors.white54, size: 18),
      ],
    );
  }

  Widget _gradientButton(String text) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.convertCoin);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff9B5CFF), Color(0xff5B9DFF)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
