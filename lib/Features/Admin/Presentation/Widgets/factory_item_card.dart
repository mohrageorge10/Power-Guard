import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

enum FactoryStatus { active, suspended, rejected }

class FactoryListCard extends StatelessWidget {
  final String name;
  final String factoryId;
  final String location;
  final String imagePath;
  final FactoryStatus status;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onRemove;

  const FactoryListCard({
    super.key,
    required this.name,
    required this.factoryId,
    required this.location,
    required this.imagePath,
    required this.status,
    this.onPrimaryAction,
    this.onRemove,
  });

  Color get _statusColor {
    switch (status) {
      case FactoryStatus.active:
        return AppColors.successGreen; // Dark Green for Active
      case FactoryStatus.suspended:
        return AppColors.smeltingBrown; // Orange for Suspended
      case FactoryStatus.rejected:
        return AppColors.errorRed; // Dark Red for Rejected
    }
  }

  String get _statusLabel {
    switch (status) {
      case FactoryStatus.active:
        return AppStrings.statusActive;
      case FactoryStatus.suspended:
        return AppStrings.statusSuspended;
      case FactoryStatus.rejected:
        return AppStrings.statusRejected;
    }
  }

  String get _primaryBtnLabel {
    switch (status) {
      case FactoryStatus.active:
        return AppStrings.suspendBtn;
      case FactoryStatus.suspended:
        return AppStrings.activeBtn;
      case FactoryStatus.rejected:
        return AppStrings.reviewAppealBtn;
    }
  }

  Color get _primaryBtnColor {
    switch (status) {
      case FactoryStatus.active:
        return AppColors.brightOrange;
      case FactoryStatus.suspended:
        return AppColors.successGreen;
      case FactoryStatus.rejected:
        return AppColors.labPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary100Color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Company Pic
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ID: $factoryId • $location',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.slateGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // (Active, Suspended, Rejected) Status
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: _statusColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  _statusLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // spacing line
          const SizedBox(height: 16),
          Divider(color: AppColors.lightBlueBg, height: 1),
          const SizedBox(height: 12),

          // Primary Actions
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onPrimaryAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryBtnColor,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    minimumSize: const Size(0, 35),
                  ),
                  child: Text(
                    _primaryBtnLabel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Spacing
              const SizedBox(width: 40),
              Expanded(
                child: ElevatedButton(
                  onPressed: onRemove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorRed,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    minimumSize: const Size(0, 35),
                  ),
                  child: Text(
                    AppStrings.removeBtn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
