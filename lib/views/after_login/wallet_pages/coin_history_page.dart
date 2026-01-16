import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinsHistoryPage extends StatelessWidget {
  const CoinsHistoryPage({super.key});

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
              const CoinsHeader(),
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
              const AvailableCoinsCard(),
              const SizedBox(height: 16),
              const CoinsSummaryCard(),
              const SizedBox(height: 16),
              const Expanded(child: CoinsHistoryList()),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────────── HEADER ───────────────── */

class CoinsHeader extends StatelessWidget {
  const CoinsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Coins History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Tune in to Relax!",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
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

/* ───────────────── AVAILABLE COINS ───────────────── */

class AvailableCoinsCard extends StatelessWidget {
  const AvailableCoinsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Available Coins",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Icon(Icons.more_horiz, color: Colors.white54),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.circle, size: 10, color: Colors.amber),
              SizedBox(width: 6),
              Text("2 Coins", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Estimated Value: ₹100",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _actionButton("Buy Coins", () {
                Get.toNamed(AppRoutes.buyCoin);
              }),
              const SizedBox(width: 12),
              _actionButton("Convert Coins", () {
                Get.toNamed(AppRoutes.convertCoin);
              }),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _actionButton(String text, VoidCallback onTap) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.purpleAccent.withOpacity(0.6)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

/* ───────────────── COINS SUMMARY ───────────────── */

class CoinsSummaryCard extends StatelessWidget {
  const CoinsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coins Summary",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Icon(Icons.filter_alt, color: Colors.white54),
            ],
          ),
          SizedBox(height: 12),
          SummaryRow(label: "Total Purchased", value: "1200 Coins"),
          SummaryRow(label: "Total Earned", value: "350 Coins"),
          Divider(color: AppColors.white54),
          SummaryRow(label: "Total Spent", value: "1548 Coins"),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

/* ───────────────── HISTORY LIST ───────────────── */

class CoinsHistoryList extends StatelessWidget {
  const CoinsHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      children: const [
        HistoryTile(
          title: "Coin Purchase",
          coins: "+100 Coins",
          amount: "₹50",
          date: "Yesterday, 10:20 AM",
        ),
        HistoryTile(
          title: "Video Call",
          coins: "+20 Coins",
          amount: "₹50",
          date: "Dec 24, 2025",
        ),
        HistoryTile(
          title: "Live Stream Earning",
          coins: "-10 Coins",
          amount: "₹50",
          date: "Dec 23, 2025",
        ),

        HistoryTile(
          title: "Coin Purchase",
          coins: "+100 Coins",
          amount: "₹50",
          date: "Yesterday, 10:20 AM",
        ),
        HistoryTile(
          title: "Video Call",
          coins: "+20 Coins",
          amount: "₹50",
          date: "Dec 24, 2025",
        ),
        HistoryTile(
          title: "Live Stream Earning",
          coins: "-10 Coins",
          amount: "₹50",
          date: "Dec 23, 2025",
        ),

        HistoryTile(
          title: "Coin Purchase",
          coins: "+100 Coins",
          amount: "₹50",
          date: "Yesterday, 10:20 AM",
        ),
        HistoryTile(
          title: "Video Call",
          coins: "+20 Coins",
          amount: "₹50",
          date: "Dec 24, 2025",
        ),
        HistoryTile(
          title: "Live Stream Earning",
          coins: "-10 Coins",
          amount: "₹50",
          date: "Dec 23, 2025",
        ),
      ],
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String title, coins, amount, date;

  const HistoryTile({
    super.key,
    required this.title,
    required this.coins,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                "$coins | $amount",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

/* ───────────────── COMMON CARD STYLE ───────────────── */

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    gradient: LinearGradient(
      colors: [Colors.white.withOpacity(0.08), Colors.white.withOpacity(0.02)],
    ),
    border: Border.all(color: Colors.purpleAccent.withOpacity(0.4)),
  );
}
