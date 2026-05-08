import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_app_bar.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Presentation/Widgets/alert_card_widget.dart';
import 'package:power_guard/Core/Presentation/Widgets/consumption_graph_card.dart';
import 'package:power_guard/Core/Presentation/Widgets/custom_header.dart';
import 'package:power_guard/Features/Factory/Presentation/Widgets/efficiency_by_dept.dart';
import 'package:power_guard/Features/Factory/Presentation/Widgets/distribution_of_sections.dart';
import 'package:power_guard/Features/Factory/Presentation/Widgets/set_department_limits.dart';
import 'package:power_guard/Features/Factory/Presentation/Widgets/factory_status.dart';


class FactoryManagerScreen extends StatefulWidget {
  const FactoryManagerScreen({super.key});

  @override
  State<FactoryManagerScreen> createState() => _FactoryManagerScreenState();
}

class _FactoryManagerScreenState extends State<FactoryManagerScreen> {
  bool isCritical = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: SharedAppBar(
        userName: AppStrings.appBarTitle,
        userImage: Assets.imagesFactoryManger,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              title: AppStrings.overviewHeader,
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 2.5),
                decoration: BoxDecoration(
                  color: AppColors.primary100Color,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(80),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  AppStrings.lastUpdated,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),


            // 2. KPI Cards 1
            KpiCard.buildKpiRow(
              height: 135,
              value1: AppStrings.spendingValue,
              valueFontSize1: 20,
              label1: AppStrings.totalSpendingToday,
              labelFontSize1: 13.5,
              icon1: Assets.imagesElectric,
              color1: AppColors.primaryColor,
              trailing1: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_drop_down, color: Colors.greenAccent, size: 20),
                  Text(
                    AppStrings.spendingTrend2,
                    style: TextStyle(color: Colors.greenAccent, fontSize: 10),
                  ),
                ],
              ),


              // Card 2
              value2: AppStrings.limitValue,
              valueFontSize2: 20,
              label2: AppStrings.dailyAvailableLimit,
              labelFontSize2: 13.5,
              icon2: Assets.imagesElectric,
              color2: AppColors.onBoardingBlue2,
              trailing2: Padding(
                padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: Color(0xFFD9D9D9),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4A5AB5)),
                    minHeight: 6.5,
                  ),
                ),
              ),
             ),
            ),
            const SizedBox(height: 20),

            // 3. Status Card
            InfoStatusCard(
              title: AppStrings.factoryStatusTitle,
              subtitle: AppStrings.statusHighConsumption,
              description: AppStrings.factoryStatusSub,
              iconPath: Assets.imagesGroup,
              backgroundColor: AppColors.accentBlue,
              contentColor: Colors.white,
             ),

            const SizedBox(height: 25),

            InfoStatusCard(
              title: AppStrings.highestCategoryTitle,
              subtitle: AppStrings.highestCategoryDept,
              description: AppStrings.highestCategoryValue,
              iconPath: Assets.imagesVector,
              backgroundColor: AppColors.lightBg,
              contentColor: AppColors.primaryColor,
             )
            ,
            const SizedBox(height: 25),

            // Distribution
            const DistributionSectionsCard(),
            const SizedBox(height: 25),

            // 5. Consumption Graph
            const ConsumptionGraphCard(
              value: AppStrings.hourlyPulseValue,
              trend: '5% less than yesterday',
              trendPositive: true,
            ),
            const SizedBox(height: 25),

            // Alerts & View All
            CustomHeader(
              title: AppStrings.activeAlertsHeader,
              trailing: TextButton(
                onPressed: () {
                },
                child: Text(
                  AppStrings.viewAll,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 6. Alerts
            AlertCardWidget(
              machineName: 'Machine 1',
              sectorInfo: 'Sector 4 • 124 kWh',
              alertType: AlertType.critical,
              iconAsset: Assets.imagesAssLine,
              actionLabel: AppStrings.investigateBtn,
              onAction: () {},
            ),
            const SizedBox(height: 20),
            AlertCardWidget(
              machineName: 'Machine 2',
              sectorInfo: 'Sector 1 • 85 kWh',
              alertType: AlertType.warning,
              iconAsset: Assets.imagesLab,
              actionLabel: AppStrings.dismissBtn,
              onAction: () {},
            ),
            const SizedBox(height: 30),

            // Efficiency & Limits
            const EfficiencyByDeptCard(),
            const SizedBox(height: 50),

            // Set Department Limits
            const SetDepartmentLimitsPage(),
            const SizedBox(height: 150),
           ],
        ),
      ),


       // Bottom Navigation Bar
       bottomNavigationBar: SharedBottomNav(
         currentIndex: 0,
         customItems: [
           CustomNavItem(assetPath: Assets.imagesHome, label: AppStrings.homeBtn),
           CustomNavItem(assetPath: Assets.imagesFactories, label: AppStrings.factoriesBtn),
           CustomNavItem(assetPath: Assets.imagesAlert, label: AppStrings.alert),
           CustomNavItem(assetPath: Assets.imagesProfile, label: AppStrings.profileBtn),
          ],
       )
    );
  }

  // --- UI Helpers ---

  Widget buildKpiBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(80),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 9),
      ),
    );
  }

  Widget buildSectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }


  Widget buildLimitRow(String name, String limit, IconData icon, bool val) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
          backgroundColor: AppColors.primary100Color,
          child: Icon(icon, color: AppColors.primaryColor)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Max: $limit'),
      trailing: Switch(
        value: val,
        onChanged: (bool v) {},
        activeTrackColor: AppColors.primaryColor,
      ),
    );
  }

}