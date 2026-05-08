import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/Custom_header.dart';
import 'package:power_guard/Core/Presentation/Widgets/kpi_card.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_app_bar.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Presentation/Widgets/alert_card_widget.dart';
import 'package:power_guard/Core/Presentation/Widgets/consumption_graph_card.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/last_read_card.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/usage_table_row.dart';



class DeptHomeScreen extends StatelessWidget {
  const DeptHomeScreen({super.key});

  static const List<Map<String, dynamic>> _usageData = [
    {'time': 'PM\n02:15', 'val': '350', 'cons': '45+', 'status': RowStatus.normal},
    {'time': 'PM\n01:30', 'val': '750', 'cons': '300+', 'status': RowStatus.critical},
    {'time': 'AM\n10:00', 'val': '205', 'cons': '55+', 'status': RowStatus.normal},
    {'time': 'AM\n09:20', 'val': '150', 'cons': '40+', 'status': RowStatus.normal},
    {'time': 'AM\n08:45', 'val': '110', 'cons': '60+', 'status': RowStatus.normal},
    {'time': 'AM\n08:00', 'val': '50', 'cons': '50+', 'status': RowStatus.normal},
  ];

  @override
  // App Bar
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SharedAppBar(
        userName: 'Department Manager',
        userImage: Assets.imagesDepLead,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              title: AppStrings.overviewHeader,
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
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


            // 2. KPI Cards
            KpiCard.buildKpiRow(
              height: 135,
              // (Actual Consumption)
              value1: '550 KW',
              label1: AppStrings.actualConsumption,
              icon1: Assets.imagesElectric,
              color1: AppColors.primaryColor,
              trailing1: buildKpiBadge('per day'),

              // (Remaining Allowance)
              value2: '1,450 kw',
              label2: AppStrings.remainingAllowance,
              icon2: Assets.imagesOverlay,
              color2: AppColors.onBoardingBlue2,
              trailing2: buildKpiBadge('limit : 2000'),
            ),

            const SizedBox(height: 20),

            // Last Read Card
            LastReadCard(cumulativeValue: '550 KW', time: '02:15 PM'),
            const SizedBox(height: 24),

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

            // Alerts
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

            // Graph
            ConsumptionGraphCard(
              value: AppStrings.hourlyPulseValue,
              trend: '2.1% Less than yesterday',
              trendPositive: true,
            ),
            const SizedBox(height: 24),

            // Usage Table
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.lightBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.lightBg,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildUsageTableHeader(),
                  const Divider(color: AppColors.lightGreyBg, height: 1),
                  // Data
                  ..._usageData.map((data) => UsageTableRow(
                    time: data['time'],
                    value: data['val'],
                    consumption: data['cons'],
                    status: data['status'],
                  )),
                ],
              ),
            ),

            const SizedBox(height: 40),

            _buildActionButtons(context),
            const SizedBox(height: 90),
      ],
        ),
      ),


      // Bottom Bar
      bottomNavigationBar: const SharedBottomNav(
        currentIndex: 0,
      ),
    );
  }

  Widget _buildUsageTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: const [
          Expanded(child: Text('(TIME)', style: TextStyle(color: AppColors.primaryColor, fontSize: 10, fontWeight: FontWeight.w600))),
          Expanded(child: SizedBox()),

          Expanded(child: Text('(VALUE)', style: TextStyle(color: AppColors.primaryColor, fontSize: 10, fontWeight: FontWeight.w600))),
          Expanded(child: SizedBox()),

          Expanded(child: Text('(CONSUMPTION)', style: TextStyle(color: AppColors.primaryColor, fontSize: 10, fontWeight: FontWeight.w600))),
          Expanded(child: SizedBox()),
          Expanded(child: Text('(STATUS)', style: TextStyle(color: AppColors.primaryColor, fontSize: 10, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }



  // --- UI Helpers ---
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionContainer(
            imagePath: Assets.imagesError,
            label: AppStrings.reportIssuesBtn,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionContainer(
            imagePath: Assets.imagesElectric2,
            label: AppStrings.enterEnergyBtn,
            onTap: () {},
          ),
        ),
      ],
    );
  }



  Widget buildBadge(String text, {bool isWhite = false}) {
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

  Widget _buildActionContainer({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.navyblue,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(imagePath, height: 30, width: 30),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}