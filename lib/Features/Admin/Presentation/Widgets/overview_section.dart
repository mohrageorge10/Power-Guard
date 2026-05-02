import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.overviewHeader,
              style: const TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppStrings.lastUpdated,
              style: const TextStyle(
                color: AppColors.textSecondaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.strokeColor),
          ),
          child: Column(
            children: [
              _buildSpendRow(
                AppStrings.totalSpendingToday,
                AppStrings.spendingValue,
                AppColors.primaryColor,
              ),
              const Divider(height: 24),
              _buildSpendRow(
                AppStrings.dailyAvailableLimit,
                AppStrings.limitValue,
                AppColors.textSecondaryColor,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.trending_up, color: AppColors.errorColor, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    AppStrings.spendingTrend,
                    style: const TextStyle(
                      color: AppColors.errorColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpendRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondaryColor,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
