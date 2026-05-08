import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';


 class CustomNavItem {
  final String assetPath;
  final String label;

  CustomNavItem({required this.assetPath, required this.label});
}

class SharedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;


  final List<CustomNavItem>? customItems;

  const SharedBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.customItems,
  });

  @override
  Widget build(BuildContext context) {
     final List<CustomNavItem> itemsToShow = customItems ?? [
      CustomNavItem(assetPath: Assets.imagesHome, label: 'Home'),
      CustomNavItem(assetPath: Assets.imagesEnergy, label: 'Energy'),
      CustomNavItem(assetPath: Assets.imagesAlert, label: 'Alerts'),
      CustomNavItem(assetPath: Assets.imagesProfile, label: 'Profile'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedItemColor: const Color(0xFF9CA3AF),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),

         items: List.generate(itemsToShow.length, (index) {
          return _buildNavItem(
              itemsToShow[index].assetPath,
              itemsToShow[index].label,
              index
          );
        }),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String assetPath, String label, int index) {
    bool isSelected = currentIndex == index;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          assetPath,
          height: 22,
          width: 22,
          color: isSelected ? AppColors.primaryColor : const Color(0xFF9CA3AF),
        ),
      ),
      label: label,
    );
  }
}