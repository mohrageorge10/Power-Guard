
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

class OverviewHeader extends StatelessWidget {
  const OverviewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.overviewHeader,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
          decoration: BoxDecoration(
            color: AppColors.primary100Color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: Text(
            AppStrings.lastUpdated,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
