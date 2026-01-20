import 'package:chat_app/res/app_colors.dart';
import 'package:chat_app/utils/textStyle.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues ageRange = const RangeValues(18, 45);
  bool onlineOnly = false;
  String selectedGender = "All";
  String selectedLocation = "Nearby";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.graPurple1,
            AppColors.gradientBlack,
            AppColors.balckBlue,
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Center(
            child: Text(
              "Filter",
              style: textStyle18(FontWeight.bold, color: AppColors.white),
            ),
          ),

          const SizedBox(height: 20),

          /// LOCATION
          Text(
            "Location",
            style: textStyle14(FontWeight.w600, color: AppColors.white),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _chip("Nearby"),
              const SizedBox(width: 10),
              _chip("Global"),
            ],
          ),

          const SizedBox(height: 20),

          /// AGE RANGE
          Text(
            "Age Range",
            style: textStyle14(FontWeight.w600, color: AppColors.white),
          ),
          RangeSlider(
            values: ageRange,
            min: 18,
            max: 60,
            divisions: 42,
            labels: RangeLabels(
              ageRange.start.round().toString(),
              ageRange.end.round().toString(),
            ),
            onChanged: (value) {
              setState(() => ageRange = value);
            },
          ),

          const SizedBox(height: 10),

          /// GENDER
          Text(
            "Gender",
            style: textStyle14(FontWeight.w600, color: AppColors.white),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _chip("All"),
              const SizedBox(width: 10),
              _chip("Male"),
              const SizedBox(width: 10),
              _chip("Female"),
            ],
          ),

          const SizedBox(height: 20),

          /// ONLINE
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Online Only",
              style: textStyle14(FontWeight.w600, color: AppColors.white),
            ),
            value: onlineOnly,
            activeThumbColor: AppColors.mainColors,
            onChanged: (value) {
              setState(() => onlineOnly = value);
            },
          ),

          const SizedBox(height: 20),

          /// ACTION BUTTONS
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      ageRange = const RangeValues(18, 45);
                      onlineOnly = false;
                      selectedGender = "All";
                      selectedLocation = "Nearby";
                    });
                  },
                  child: const Text("Reset"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColors,
                  ),
                  onPressed: () {
                    // TODO: Apply filter logic
                    Navigator.pop(context);
                  },
                  child: const Text("Apply"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    final isSelected = (text == selectedGender) || (text == selectedLocation);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (text == "Nearby" || text == "Global") {
            selectedLocation = text;
          } else {
            selectedGender = text;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.graPurple1),
          color: isSelected ? AppColors.mainColors : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: textStyle14(
            FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.white54,
          ),
        ),
      ),
    );
  }
}
