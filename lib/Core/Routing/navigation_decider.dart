import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';

class NavigationDecider {
  static const String roleAdmin = "Admin"; 
  static const String roleFactoryManager = "FactoryManager"; 
  static const String roleDepartmentManager = "DepartmentManager";

  // Pass the role directly as a parameter
  static void navigateBasedOnRole(BuildContext context, String role) {
    if (role == roleAdmin) {
      Navigator.pushReplacementNamed(context, AppRoutes.adminHomeScreen); // Make sure this route is correct
    } else if (role == roleFactoryManager) {
      Navigator.pushReplacementNamed(context, AppRoutes.factoryMangerScreen);
    } else if (role == roleDepartmentManager) {
      Navigator.pushReplacementNamed(context, AppRoutes.deptHomeScreen);
    } else {
      // Print the exact role value so we can see if it's empty or wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Role Detected: '$role'"),
          backgroundColor: AppColors.errorColor,
        ),
      );
    }
  }
}