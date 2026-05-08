import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Presentation/Widgets/alert_card_widget.dart';

class EmergencyAlertScreen extends StatelessWidget {
  final int currentIndex;
  final List<CustomNavItem>? customNavItems;
  const EmergencyAlertScreen({super.key ,this.currentIndex = 2 ,this.customNavItems,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(
            Assets.imagesArrowLeft,
            height: 25,
            width: 25,
          ),
        ),
        title: Text(
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
            _buildCircularIndicator(),
            const SizedBox(height: 30),
            _buildCriticalOverloadBadge(),
            const SizedBox(height: 25),
            _buildEmergencyStopButton(),
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
                _expandedBtn(
                  label: AppStrings.muteAlarmBtn,
                  iconAsset: Assets.imagesMute,
                  color: AppColors.mute,
                ),
                const SizedBox(width: 16),
                _expandedBtn(
                  label: AppStrings.contactMaintBtn,
                  iconAsset: Assets.imagesContact,
                  color: AppColors.action,
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),

       bottomNavigationBar: SharedBottomNav(
        currentIndex: currentIndex,
         customItems: customNavItems,
       ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildCircularIndicator() {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          height: 285,
          width: 285,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(280, 280),
                painter: CircularPainter(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.loadValue,
                    style: const TextStyle(
                      color: AppColors.alertRed,
                      fontSize: 26.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppStrings.currentLoadLabel,
                    style: const TextStyle(
                      color: AppColors.alertRed,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCriticalOverloadBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.alertRed.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.alertRed.withAlpha(40), width: 3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesOverloaded,
            height: 20,
            width: 20,
            color: const Color(0xFFEF4444),
          ),
          const SizedBox(width: 8),
          const Text(
            AppStrings.criticalOverload,
            style: TextStyle(
              color: AppColors.alertRed,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyStopButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.alertRed.withAlpha(50),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.alertRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesPowerOff,
                height: 25,
                width: 25,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              const Text(
                AppStrings.emergencyStopBtn,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandedBtn({
    required String label,
    required String iconAsset,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconAsset, height: 24, width: 24, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 class CircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = 30.0;
    final radius = (size.width / 2) - (strokeWidth / 2);

    final redPaint = Paint()
      ..color = AppColors.alertRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 10, 20, false, redPaint);

    final darkPaint = Paint()
      ..color = AppColors.mute
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 100, 1.0, false, darkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}