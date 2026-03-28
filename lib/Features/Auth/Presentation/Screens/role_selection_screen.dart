import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/welcome_screen_custom_button.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/role_card.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                BackArrow(),
                AuthHeader(
                  title: AppStrings.appName,
                  subtitle: AppStrings.welcome,
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  height: 36,
                  subtitleColor: AppColors.textSubTitleColor,
                ),
                SizedBox(height: 50),
                Text(
                  AppStrings.chooseRole,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 60),
                RoleCard(
                  imagePath: Assets.imagesOwner,
                  title: AppStrings.adminTitle,
                  description: AppStrings.adminSubTitle,
                ),
                SizedBox(height: 32),
                RoleCard(
                  imagePath: Assets.imagesManager,
                  title: AppStrings.managerTitle,
                  description: AppStrings.managerSubTitle,
                ),
                SizedBox(height: 32),
                RoleCard(
                  imagePath: Assets.imagesDepLead,
                  title: AppStrings.leadTitle,
                  description: AppStrings.leadSubTitle,
                ),
                SizedBox(height: 38),
                WelcomeScreenCustomButton(
                  routeName: AppRoutes.signupScreen,
                  bgColor: AppColors.primaryColor,
                  txtColor: Colors.white,
                  text: AppStrings.signUp,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
