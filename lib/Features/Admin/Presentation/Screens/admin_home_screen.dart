import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/admin_app_bar.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/inbox_item_card.dart';
import 'package:power_guard/Features/Admin/Presentation/Widgets/overview_header.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/badge.dart';


class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  // Cards for Overview Section
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AdminAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            OverviewHeader(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: KpiCard(
                    value: '2',
                    label: AppStrings.activeFactories,
                    iconAsset: Assets.imagesActiveFac,
                   ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: KpiCard(
                    value: '4',
                    label: AppStrings.totalFactories,
                    iconAsset: Assets.imagesTotalFac,
                     trailing: BuildBadge(text:AppStrings.newThisWeek),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            KpiCard(
              value: '2',
              label: AppStrings.pendingRequests,
              backgroundColor: AppColors.onBoardingBlue2,
              iconAsset: Assets.imagesPenRequests,
               trailing: BuildBadge(isWhite: true, text: AppStrings.pendingLabel),
            ),
            const SizedBox(height: 32),
            _buildInboxHeader(),
            const SizedBox(height: 20),
            const InboxItemCard(
              senderName: AppStrings.sender1,
              companyName: AppStrings.company1,
              timeAgo: AppStrings.timeAgo2h,
            ),
            const SizedBox(height: 16),
            const InboxItemCard(
              senderName: AppStrings.sender2,
              companyName: AppStrings.company2,
              timeAgo: AppStrings.timeAgo1h,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }


  // Widget for the Inbox Header
  Widget _buildInboxHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.inboxTitle,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.viewAll,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
