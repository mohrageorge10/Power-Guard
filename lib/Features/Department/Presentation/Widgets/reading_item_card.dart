import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class ReadingItemCard extends StatelessWidget {
  final String time;
  final String value;

  const ReadingItemCard({super.key, required this.time, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        // Card Background
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Reading Time
          Text(
            time,
            style: const TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 13,
            ),
          ),

          // Reading Value
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
