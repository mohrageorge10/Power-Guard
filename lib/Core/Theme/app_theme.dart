import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Inter',

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    progressIndicatorTheme:  ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),

    // ================= TextField =================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primary100Color,

      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

      hintStyle: const TextStyle(
        color: AppColors.textSubTitleColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),

      errorStyle: const TextStyle(color: AppColors.errorColor),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 2, color: Colors.white),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 2, color: Colors.white),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 2, color: Colors.white),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
      ),
    ),
  );
}
