import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class CriticalOverloadBadge extends StatelessWidget {
  const CriticalOverloadBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.alertRed.withAlpha(30),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.alertRed.withAlpha(40), width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesOverloaded,
            height: 20,
            width: 20,
            color: const Color(0xFFEF4444),
          ),
          const SizedBox(width: 8),
          const Text(
            AppStrings.criticalOverload,
            style: TextStyle(
              color: AppColors.alertRed,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
