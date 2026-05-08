import 'package:flutter/material.dart';
import 'package:power_guard/Core/Presentation/Widgets/emergency_alert_screen.dart';
import 'package:power_guard/Core/Presentation/Widgets/shared_bottom_nav.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';



class FactoryEmergencyScreen extends StatelessWidget {
const FactoryEmergencyScreen({super.key});

@override
Widget build(BuildContext context) {
return EmergencyAlertScreen(

currentIndex: 2,
customNavItems: [
CustomNavItem(assetPath: Assets.imagesHome, label: AppStrings.homeBtn),
CustomNavItem(assetPath: Assets.imagesFactories, label: AppStrings.factoriesBtn),
CustomNavItem(assetPath: Assets.imagesAlert, label: AppStrings.alert),
CustomNavItem(assetPath: Assets.imagesProfile, label: AppStrings.profileBtn),
],
);
}
}


