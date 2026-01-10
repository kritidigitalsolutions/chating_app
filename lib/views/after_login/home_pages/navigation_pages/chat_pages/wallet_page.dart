import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:chat_app/res/app_colors.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Positioned.fill(
            child: Image.asset(
              "assets/images/couple-park.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.75)),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topBar(),
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
        ],
      ),
    );
  }

  // ───────── TOP BAR ─────────
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "My Wallet",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white12,
          child: Icon(
            Icons.account_balance_wallet,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }

  // ───────── ACTION ICONS ─────────
  Widget _actionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconItem(Icons.card_giftcard, "Gift Sent"),
        _iconItem(Icons.videocam, "Video Call"),
        _iconItem(Icons.history, "Coins History"),
        _iconItem(Icons.wifi_tethering, "Live Streaming"),
      ],
    );
  }

  Widget _iconItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white12,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
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
            children: const [
              Icon(Icons.monetization_on, color: Colors.amber),
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
          const Icon(Icons.monetization_on, size: 14, color: Colors.amber),
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
          _cardHeader("Live Stream Earning"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Balance",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              Row(
                children: const [
                  Icon(Icons.monetization_on, color: Colors.amber, size: 16),
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
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: _gradientButton("Convert Coins"),
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
          _cardHeader("Transaction History"),
          const SizedBox(height: 10),
          _transactionItem("Sent Gift to Ankita", "-5 Coins"),
          _transactionItem("Video Call with Ritu", "-10 Coins"),
          _transactionItem("Coin Purchase", "+50 Coins"),
          _transactionItem("Live Stream Earning", "+15 Coins"),
          const SizedBox(height: 6),
          Center(
            child: Text(
              "Explore More",
              style: TextStyle(color: AppColors.mainColors, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ───────── COMMON UI ─────────
  Widget _glassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.08),
        border: Border.all(color: Colors.white24),
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
        const Icon(Icons.more_vert, color: Colors.white54, size: 18),
      ],
    );
  }

  Widget _gradientButton(String text) {
    return Container(
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
    );
  }
}
