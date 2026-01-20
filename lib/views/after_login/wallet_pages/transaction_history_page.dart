import 'package:chat_app/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.graPurple1,
        elevation: 0,
        title: const Text(
          "Transaction History",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
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
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: transactionList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final item = transactionList[index];
            return _transactionTile(
              title: item.title,
              coins: item.coins,
              isCredit: item.isCredit,
            );
          },
        ),
      ),
    );
  }
}

/* -------------------- TRANSACTION TILE -------------------- */

Widget _transactionTile({
  required String title,
  required String coins,
  required bool isCredit,
}) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.white24),
      color: Colors.white.withOpacity(0.06),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          coins,
          style: TextStyle(
            color: isCredit ? Colors.greenAccent : Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

/* -------------------- MODEL -------------------- */

class TransactionModel {
  final String title;
  final String coins;
  final bool isCredit;

  TransactionModel({
    required this.title,
    required this.coins,
    required this.isCredit,
  });
}

/* -------------------- DUMMY DATA -------------------- */

final List<TransactionModel> transactionList = [
  TransactionModel(
    title: "Sent Gift to Ankita",
    coins: "-5 Coins",
    isCredit: false,
  ),
  TransactionModel(
    title: "Video Call with Ritu",
    coins: "-10 Coins",
    isCredit: false,
  ),
  TransactionModel(title: "Coin Purchase", coins: "+50 Coins", isCredit: true),
  TransactionModel(
    title: "Live Stream Earning",
    coins: "+15 Coins",
    isCredit: true,
  ),

  TransactionModel(
    title: "Sent Gift to Ankita",
    coins: "-5 Coins",
    isCredit: false,
  ),
  TransactionModel(
    title: "Video Call with Ritu",
    coins: "-10 Coins",
    isCredit: false,
  ),
  TransactionModel(title: "Coin Purchase", coins: "+50 Coins", isCredit: true),
  TransactionModel(
    title: "Live Stream Earning",
    coins: "+15 Coins",
    isCredit: true,
  ),
];
