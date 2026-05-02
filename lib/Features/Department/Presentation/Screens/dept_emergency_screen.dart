import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Presentation/Widgets/alert_card_widget.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/circular_indicator_widget.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/critical_overload_badge.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/emergency_stop_button.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/action_button.dart';

class DeptEmergencyScreen extends StatelessWidget {
  const DeptEmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          AppStrings.emergencyAlertTitle,
          style: TextStyle(
            color: Color(0xFFEF4444),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            const CircularIndicatorWidget(),
            const SizedBox(height: 30),
            const CriticalOverloadBadge(),
            const SizedBox(height: 25),
            const EmergencyStopButton(),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppStrings.emergencyStopSub,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 40),
            AlertCardWidget(
              machineName: 'machine 1',
              sectorInfo: 'Sector 4 • 124 kWh',
              alertType: AlertType.critical,
              iconAsset: Assets.imagesCard1,
              trailingValue: '98°C',
              trailingStatus: AppStrings.overheatingLabel,
            ),
            const SizedBox(height: 20),
            AlertCardWidget(
              machineName: 'machine 2',
              sectorInfo: 'Sector 1 • 85 kWh',
              alertType: AlertType.warning,
              iconAsset: Assets.imagesCard2,
              trailingValue: '82°C',
              trailingStatus: AppStrings.warningLabel,
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    label: AppStrings.muteAlarmBtn,
                    iconAsset: Assets.imagesMute,
                    color: AppColors.mute,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ActionButton(
                    label: AppStrings.contactMaintBtn,
                    iconAsset: Assets.imagesContact,
                    color: AppColors.action,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: const SharedBottomNav(currentIndex: 2),
    );
  }
}
