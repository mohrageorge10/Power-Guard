import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Features/Assign/Presentation/Widgets/next_step.dart';
import 'package:power_guard/Features/Assign/Presentation/Widgets/whats_next_header.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';

class ApplicationUnderReviewScreen extends StatelessWidget {
  final String factoryName;
  final String factoryLocation;
  final String factoryDescription;

  const ApplicationUnderReviewScreen({
    super.key,
    required this.factoryName,
    required this.factoryLocation,
    required this.factoryDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 2),
            child: Image.asset(Assets.imagesAppLogo, width: 36, height: 36),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 35),

              // Verified icon
              SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: Image.asset(
                    Assets.imagesReview,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Title
              const Text(
                AppStrings.assignTitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 17),

              // Subtitle
              Text(
                AppStrings.assignDes,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimaryColor.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),

              // Review Data Card
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary100Color,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WhatsNextHeader(),
                    const SizedBox(height: 16),
                    NextStep(
                      iconPath: Assets.imagesNumber1,
                      label: factoryName, // Display actual typed name
                    ),
                    const SizedBox(height: 12),
                    NextStep(
                      iconPath: Assets.imagesNumber2,
                      label: factoryLocation, // Display actual typed location
                    ),
                    const SizedBox(height: 12),
                    NextStep(
                      iconPath: Assets.imagesNumber3,
                      label: factoryDescription, // Display actual typed description
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              CustomFormButton(
                innerText: "Back to Login", 
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (route) => false);
                }, 
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}