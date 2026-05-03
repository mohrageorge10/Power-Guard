import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import '../Widgets/admin_app_bar.dart';
import '../Widgets/admin_bottom_nav.dart';
import '../Widgets/inbox_item_card.dart';

class AdminInboxScreen extends StatelessWidget {
  const AdminInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AdminAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _buildInboxHeader(),
          const SizedBox(height: 12),
          InboxItemCard(
            senderName: AppStrings.sender1,
            companyName: AppStrings.company1,
            timeAgo: AppStrings.timeAgo2h,
          ),
          const SizedBox(height: 16),
          InboxItemCard(
            senderName: AppStrings.sender2,
            companyName: AppStrings.company2,
            timeAgo: AppStrings.timeAgo1h,
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: const AdminBottomNav(currentIndex: 2),
    );
  }

  Widget _buildInboxHeader() {
    return Row(
      children: [
        Image.asset(Assets.imagesInbox, height: 22, width: 22),
        const SizedBox(width: 10),
        Text(
          AppStrings.inboxCount,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
