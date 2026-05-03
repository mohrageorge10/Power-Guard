import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import '../Widgets/admin_app_bar.dart';
import '../Widgets/admin_bottom_nav.dart';
import '../Widgets/inbox_item_card.dart';

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
            _buildOverviewHeader(),
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
                     trailing: _buildBadge(AppStrings.newThisWeek),
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
               trailing: _buildBadge(AppStrings.pendingLabel, isWhite: true),
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
      bottomNavigationBar: const AdminBottomNav(currentIndex: 0),
    );
  }

   Widget _buildBadge(String text, {bool isWhite = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(8),
      ),
        child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget for the Overview Header
  Widget _buildOverviewHeader() {
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
