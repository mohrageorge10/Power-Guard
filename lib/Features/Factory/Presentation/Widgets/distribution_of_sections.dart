import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class SectionData {
  final String label;
  final double percentage;
  final Color color;

  const SectionData({
    required this.label,
    required this.percentage,
    required this.color,
  });
}

class DistributionSectionsCard extends StatelessWidget {
  const DistributionSectionsCard({super.key});

  @override
  Widget build(BuildContext context) {
     final List<SectionData> sections = [
      SectionData(
        label: 'Smelting',
        percentage: 40,
        color: AppColors.distributionYellow.withAlpha(480),
      ),
      SectionData(
        label: 'Logistics',
        percentage: 10,
        color: AppColors.distributionBlue,
      ),
      SectionData(
        label: 'Laboratory',
        percentage: 20,
        color: AppColors.distributionRed,
      ),
      SectionData(
        label: 'Assembly',
        percentage: 30,
        color: AppColors.distributionGreen,
      ),
    ];

    return Container(
      width: 380,
      height: 475 ,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.onBoardingBlue2.withAlpha(50)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Distribution of sections',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    'Last 24 Hours • kWh Usage',
                    style: TextStyle(fontSize: 15, color: Color(0xFF9C9DA0)),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: Color(0xFF9C9DA0)),
                onPressed: () {},
              ),
            ],
          ),

          const SizedBox(height: 40),

          // --- Donut Chart ---
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 70,
                    startDegreeOffset: -70,
                    sections: sections.map((s) => PieChartSectionData(
                      color: s.color,
                      value: s.percentage,
                      radius: 28,
                      showTitle: false,
                    )).toList(),
                  ),
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // --- Legend ---
          ...sections.map((s) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: s.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    s.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                ),
                Text(
                  '${s.percentage.toInt()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}