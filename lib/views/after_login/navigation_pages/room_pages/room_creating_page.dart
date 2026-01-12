import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/button.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:chat_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class RoomCreatingPage extends StatelessWidget {
  const RoomCreatingPage({super.key});

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
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topHeader(),

                SizedBox(height: 20),

                // Room name
                Text(
                  "Room Name",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                TextFieldWithBorder(),
                SizedBox(height: 20),

                // Room Description
                Text(
                  "Room Description",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                TextFieldWithBorder(maxLines: 3),
                SizedBox(height: 20),

                // Room type
                Text(
                  "Room Type (Required)",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                _roomType(),
                SizedBox(height: 20),

                //Room Privacy
                Text(
                  "Room Privacy",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                _roomPrivacy(),
                SizedBox(height: 20),

                // room entry point
                Text(
                  "Entry Setting",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                _roomEntryPoint(),
                SizedBox(height: 20),

                // room limit
                Text(
                  "Participant Limit:",
                  style: textStyle15(FontWeight.w600, color: AppColors.white54),
                ),
                SizedBox(height: 8),
                _roomLimit(),
                SizedBox(height: 20),

                // Room guideliness
                _roomGuide(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            //  alignment: Alignment.centerRight,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/user.jpg"),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.white54,
                  radius: 10,
                  child: Icon(Icons.edit, size: 10, color: AppColors.green),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Create Your ",
                  style: textStyle17(FontWeight.bold, color: AppColors.white),
                ),
                TextSpan(
                  text: "Room",
                  style: textStyle17(FontWeight.bold, color: AppColors.white),
                ),
              ],
            ),
          ),
          Text(
            "Set the vibe. Start the conversation",
            style: textStyle14(FontWeight.w500, color: AppColors.white54),
          ),
        ],
      ),
    );
  }

  // room type

  Widget _roomType() {
    final roomType = [
      "Friends",
      "Relationships",
      "Casual Chat",
      "Late Night Talks",
      "Fun & Games",
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.graPurple1),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: roomType.map((type) {
          return Container(
            constraints: const BoxConstraints(minHeight: 28),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.graPurple2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              type,
              maxLines: 1, // ⭐ IMPORTANT
              overflow: TextOverflow.ellipsis,
              style: textStyle14(FontWeight.w500, color: AppColors.white54),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _roomPrivacy() {
    final roomPrivacy = [
      "Public Room / Anyone can join",
      "Private Room / Invite-only",
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.graPurple1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Who Can Join?",
            style: textStyle14(FontWeight.w500, color: AppColors.white54),
          ),
          const SizedBox(height: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: roomPrivacy.map((type) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.graPurple2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.circle_outlined, color: AppColors.white54),
                    SizedBox(width: 5),
                    Text(
                      type,
                      style: textStyle14(
                        FontWeight.w500,
                        color: AppColors.white54,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // entryPoint

  Widget _roomEntryPoint() {
    final roomPrivacy = ["Free Entry", "Paid Entry"];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.graPurple1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Entry Mode:",
            style: textStyle14(FontWeight.w500, color: AppColors.white54),
          ),
          const SizedBox(height: 10),

          Row(
            children: roomPrivacy.map((type) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.graPurple2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.circle_outlined, color: AppColors.white54),
                    SizedBox(width: 5),
                    Text(
                      type,
                      style: textStyle14(
                        FontWeight.w500,
                        color: AppColors.white54,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // room limit

  Widget _roomLimit() {
    final roomPrivacy = ["5", "10", "25", "Unlimited"];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.graPurple1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Entry Mode:",
            style: textStyle14(FontWeight.w500, color: AppColors.white54),
          ),
          const SizedBox(height: 10),

          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: roomPrivacy.map((type) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: AppColors.graPurple2),
                ),
                child: Text(
                  type,
                  maxLines: 1, // ⭐ IMPORTANT
                  overflow: TextOverflow.ellipsis,
                  style: textStyle14(FontWeight.w500, color: AppColors.white54),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _roomGuide() {
    final guide = [
      "Be respectful",
      "No abusive language",
      "Follow community rules",
    ];
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: AppColors.graPurple2),
          ),
          child: Text(
            "Room Guideliness",
            maxLines: 1, // ⭐ IMPORTANT
            overflow: TextOverflow.ellipsis,
            style: textStyle14(FontWeight.w500, color: AppColors.white54),
          ),
        ),
        Column(
          children: guide.map((g) {
            return Row(
              children: [
                Icon(Icons.circle, size: 12, color: AppColors.green),
                SizedBox(width: 8),
                Text(
                  g,
                  style: textStyle14(FontWeight.w500, color: AppColors.white54),
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevetedButton(
              text: "Continue",
              onPressed: () {},
              backgroundColor: AppColors.graPurple1.withAlpha(150),
            ),
          ],
        ),
      ],
    );
  }
}
