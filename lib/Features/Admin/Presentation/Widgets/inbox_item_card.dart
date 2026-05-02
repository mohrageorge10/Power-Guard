import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';

// Inbox Item Card Widget
class InboxItemCard extends StatelessWidget {
  // Properties
  final String senderName;
  final String companyName;
  final String timeAgo;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  // Constructor
  const InboxItemCard({
    super.key,
    required this.senderName,
    required this.companyName,
    required this.timeAgo,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    // Main Container
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary100Color,
        borderRadius: BorderRadius.circular(16), // Corner radius: 20
        // SECTION: Border
        border: Border.all(
          color: AppColors.primaryColor.withAlpha(80), // Blue gradient look
          width: 2, // Weight: 2
        ),
        // SECTION: Shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Sender and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sender Name
                Text(
                  senderName,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // Time Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.onBoardingBlue2,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeAgo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Company Info Section
            Row(
              children: [
                Image.asset(Assets.imagesPenRequests2, height: 17, width: 17),
                const SizedBox(width: 4),
                Text(
                  companyName,
                  style: const TextStyle(
                    color: AppColors.slateGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Divider
            Divider(color: AppColors.lightBlueBg, height: 1),
            const SizedBox(height: 12),

            // Action Buttons Section
            Row(
              children: [
                // Accept Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAccept ?? () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successGreen,
                      foregroundColor: Colors.grey,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5,
                      ),
                      minimumSize: const Size(100, 32),
                    ),
                    child: Text(
                      AppStrings.acceptBtn,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                const SizedBox(width: 40),


                // Reject Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReject ?? () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.errorRed,
                      foregroundColor: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5,
                      ),
                      minimumSize: const Size(100, 32),
                    ),
                    child: Text(
                      AppStrings.rejectBtn,
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
      ),
    );
  }
}
