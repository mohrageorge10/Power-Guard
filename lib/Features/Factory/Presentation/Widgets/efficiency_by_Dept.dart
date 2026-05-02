import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';


class EfficiencyByDeptCard extends StatelessWidget {
  const EfficiencyByDeptCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 370,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary50Color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white , width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
           Text(
            AppStrings.efficiencyTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimaryColor),
          ),
           Text(
             AppStrings.hourlyPulseT,
            style: TextStyle(fontSize: 12, color: Color(0xFF9C9DA0)),
          ),
          const SizedBox(height: 20),

          // Inner Container (The Grayish Box)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary100Color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(60),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Column(
              children: [
                _DeptProgressRow(label: 'Assembly', value: 300, color: Color(0xFF4A5AB5)),
                _DeptProgressRow(label: 'LOGI', value: 120, color: Color(0xFF4A5AB5)),
                _DeptProgressRow(label: 'Smelting', value: 450, color: Color(0xFFFF0000)),
                _DeptProgressRow(label: 'LAB', value: 250, color: Color(0xFFFCD34D)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//(Private Widget)
class _DeptProgressRow extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _DeptProgressRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.textPrimaryColor)),
              Text('${value.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimaryColor)),
            ],
          ),
          const SizedBox(height: 8),
           ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value / 500,
              minHeight: 7.5,
              backgroundColor: Color(0xFFD9D9D9),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}