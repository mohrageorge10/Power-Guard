import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class BuildBadge extends StatelessWidget {
  const BuildBadge({super.key, required this.text, this.isWhite = false});
  final String text;
  final bool? isWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
