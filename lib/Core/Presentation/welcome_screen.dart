import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Presentation/Widgets/custom_app_bar.dart';
import 'package:power_guard/Core/Presentation/Widgets/feature_card.dart';
import 'package:power_guard/Core/Presentation/Widgets/welcome_screen_custom_button.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
<<<<<<< HEAD
=======
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';

>>>>>>> api

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

<<<<<<< HEAD
=======
  void Function()? get _submit => null;

>>>>>>> api
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                children: [
                  AuthHeader(
                    title: AppStrings.appName,
                    subtitle: AppStrings.welcomeSubTitle1,
                    textColor: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    height: 36,
                  ),

                  const SizedBox(height: 53),

                  Text(
                    AppStrings.welcomeSubTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),

<<<<<<< HEAD
                  // Get Started
                  const SizedBox(height: 43),
                  WelcomeScreenCustomButton(
                    routeName: AppRoutes.roleScreen,
                    bgColor: AppColors.primaryColor,
                    txtColor: Colors.white,
                    text: AppStrings.getStarted,
                  ),
=======
>>>>>>> api

                  const SizedBox(height: 43),

                  // Log In
                  WelcomeScreenCustomButton(
                    routeName: AppRoutes.loginScreen,
                    bgColor: AppColors.primary100Color,
                    txtColor: AppColors.primaryColor,
                    text: AppStrings.login,
                  ),

                  const SizedBox(height: 43),

                  Text(
                    AppStrings.whyPowerGuard,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),

                  const SizedBox(height: 43),

                  Text(
                    AppStrings.unlockFullPotential,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),

                  const SizedBox(height: 43),

                  // Cards
                  FeatureCard(
                    imagePath: Assets.imagesPredict,
                    title: AppStrings.predictPeakLoad1,
                    description: AppStrings.predictPeakLoad2,
                    link: false,
                  ),
                  const SizedBox(height: 43),
                  FeatureCard(
                    imagePath: Assets.imagesClock,
                    title: AppStrings.optimize1,
                    description: AppStrings.optimize2,
                    link: false,
                  ),
                  const SizedBox(height: 43),
                  FeatureCard(
                    imagePath: Assets.imagesMoneyBag,
                    title: AppStrings.reduceCost1,
                    description: AppStrings.reduceCost2,
                    link: false,
                  ),

                  const SizedBox(height: 43),
<<<<<<< HEAD
                ],
              ),
=======

                  //  CustomFormButton
                  CustomFormButton(
                    innerText: 'Get Started',
                    onPressed: _submit,
                    height: 48,
                  ),
                  const SizedBox(height: 100),
                ],
              ),

>>>>>>> api
            ),
          ),
        ),
      ),
    );
  }
}
