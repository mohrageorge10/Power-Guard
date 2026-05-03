import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class SetDepartmentLimitsPage extends StatelessWidget {
  const SetDepartmentLimitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.setLimitsTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  AppStrings.addNew,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Department Limits
        const _LimitItem(
          label: 'Assembly',
          value: '500',
          imagePath: Assets.imagesAssembly,
          isActive: true,
        ),
        const _LimitItem(
          label: 'Logistics',
          value: '300',
          imagePath: Assets.imagesLogistics,
          isActive: false,
        ),
        const _LimitItem(
          label: 'Smelting',
          value: '600',
          imagePath: Assets.imagesSmelting,
          isActive: false,
        ),
        const _LimitItem(
          label: 'Laboratory',
          value: '400',
          imagePath: Assets.imagesLaboratory,
          isActive: true,
        ),
      ],
    );
  }
}

class _LimitItem extends StatelessWidget {
  final String label, value, imagePath;
  final bool isActive;

  const _LimitItem({
    required this.label,
    required this.value,
    required this.imagePath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primary50Color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // FIX: wrapped with Flexible to prevent horizontal overflow
          Flexible(
            flex: 1,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary50Color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                const Text(
                  'Max: kWh',
                  style: TextStyle(
                    color: AppColors.textLightColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF1A1C1E),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // FIX: wrapped with Flexible to prevent horizontal overflow
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print('Switch toggled for $label');
              },
              child: Image.asset(
                isActive
                    ? 'assets/images/OpenF.png'
                    : 'assets/images/CloseF.png',
                width: 55,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
