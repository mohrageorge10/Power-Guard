import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

enum AlertType { critical, warning }

class AlertCardWidget extends StatelessWidget {
  final String machineName;
  final String sectorInfo;
  final AlertType alertType;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? trailingValue;
  final String? trailingStatus;
  final String iconAsset;

  const AlertCardWidget({
    super.key,
    required this.machineName,
    required this.sectorInfo,
    required this.alertType,
    required this.iconAsset,
    this.actionLabel,
    this.onAction,
    this.trailingValue,
    this.trailingStatus,
  });

  @override
  Widget build(BuildContext context) {
    final isCritical = alertType == AlertType.critical;

     final Color statusColor = isCritical ? AppColors.alertRed : AppColors.warningOrange;
    final Color bgColor = isCritical ? AppColors.alertRed.withAlpha(30) : AppColors.warningOrange.withAlpha(30);
    final Color iconBgColor = isCritical ? AppColors.alertRed.withAlpha(30) : AppColors.warningOrange.withAlpha(30);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: iconBgColor, width: 1),
      ),
      child: Row(
        children: [
           Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                iconAsset,
                fit: BoxFit.contain,
                color: statusColor,
              ),
            ),
          ),
          const SizedBox(width: 15),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  machineName,
                  style: const TextStyle( color : AppColors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  sectorInfo,
                  style: const TextStyle(color: AppColors.slateGrey, fontSize: 13),
                ),
              ],
            ),
          ),
           if (actionLabel != null)
            ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: statusColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                elevation: 0,
              ),
              child: Text(actionLabel!, style: const TextStyle(color: Colors.white)),
            )
          else if (trailingValue != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  trailingValue!,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                Text(
                  trailingStatus ?? '',
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}