import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class AdminBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AdminBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.slateGrey,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            // Home
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesHome,
                color: currentIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.slateGrey,
                height: 20,
                width: 20,
              ),
              label: AppStrings.homeBtn,
            ),

            // Factories
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesFactories,
                color: currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.slateGrey,
                height: 20,
                width: 20,
              ),
              label: AppStrings.factoriesBtn,
            ),

            // Inbox
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesInbox,
                color: currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.slateGrey,
                height: 20,
                width: 20,
              ),
              label: AppStrings.inboxBtn,
            ),

            // Profile
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.imagesProfile,
                color: currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.slateGrey,
                height: 20,
                width: 20,
              ),
              label: AppStrings.profileBtn,
            ),
          ],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
