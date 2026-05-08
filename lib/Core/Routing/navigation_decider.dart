import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Networking/API/api_keys.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';

class NavigationDecider {
 static void navigateBasedOnRole(BuildContext context) {
    final String role = CacheHelper.getData(key: ApiKey.role) ?? "";

    if (role == AppStrings.adminRole) {
      Navigator.pushReplacementNamed(context, AppRoutes.adminHomeScreen);
    } else if (role == AppStrings.managerTitle) {
      Navigator.pushReplacementNamed(context, AppRoutes.factoryMangerScreen);
    } else if (role == AppStrings.leadTitle) {
      Navigator.pushReplacementNamed(context, AppRoutes.deptHomeScreen);
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Invalid Role"),
                    backgroundColor: AppColors.errorColor,
                  ),
                );
    }
  }
}
