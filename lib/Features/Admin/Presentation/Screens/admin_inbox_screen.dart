import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_app_bar.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_header.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_item_card.dart';

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
          InboxHeader(),
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
    );
  }
}
