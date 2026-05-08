import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/custom_submit_button.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_app_bar.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';

class ElectricityReadingScreen extends StatelessWidget {
  const ElectricityReadingScreen({super.key});

  //
  static const List<Map<String, String>> _lastReadings = [
    {'time': '08:00 AM Today', 'value': '150 KWH'},
    {'time': '08:45 PM Today', 'value': '110 KWH'},
    {'time': '09:30 PM Today', 'value': '50 KWH'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SharedAppBar(
        userName: 'Department manager',
        userImage: Assets.imagesDepLead,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.enterReadingTitle,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildLastReadingCard(
              cumulativeValue: '1,200 KWH',
              time: ' - 06:42 AM Today',
            ),
            const SizedBox(height: 20),

            // 2. KPI Cards (Variance & Projected Shift)
            Row(
              children: [
                Expanded(
                  child: buildCompactKpiCard(
                    value: AppStrings.varianceLabel,
                    label: '+1.2%',
                    color: AppColors.primaryColor,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildCompactKpiCard(
                    value: AppStrings.projectedTotal,
                    label: '1600',
                    color: AppColors.onBoardingBlue2,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            _buildSectionHeader(AppStrings.last3Readings),
            const SizedBox(height: 20),

            ..._lastReadings.map(
              (reading) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _buildReadingItem(
                  time: reading['time']!,
                  value: reading['value']!,
                ),
              ),
            ),

            const SizedBox(height: 15),

            CustomSubmitButton(
              label: AppStrings.submitIssueBtn,
              onPressed: () {},
            ),
            const SizedBox(height: 12),

            _buildSaveToLogsButton(context),
            const SizedBox(height: 200),
          ],
        ),
      ),
      // 3. Bottom Nav
      bottomNavigationBar: const SharedBottomNav(currentIndex: 1),
    );
  }

  Widget _buildLastReadingCard({
    required String cumulativeValue,
    required String time,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.lastReadingDetected,
            style: TextStyle(color: AppColors.miniTitleColor, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                Assets.imagesClock2,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                cumulativeValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  time,
                  style: TextStyle(
                    color: AppColors.miniTitleColor,
                    fontSize: 18.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            AppStrings.viewAll,
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildReadingItem({required String time, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: AppColors.textSubTitleColor,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveToLogsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE8EEFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: const Text(
            AppStrings.saveToShiftLogs,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
