import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Features/Assign/Presentation/Widgets/next_step.dart';
import 'package:power_guard/Features/Assign/Presentation/Widgets/whats_next_header.dart';
import '../../../Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';


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
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                ),
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

              // What's next card
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
                  children:  [
                    WhatsNextHeader(),
                    SizedBox(height: 16),
                    NextStep(
                      iconPath: Assets.imagesNumber1,
                      label: AppStrings.factoryName,
                    ),
                    SizedBox(height: 12),
                    NextStep(
                      iconPath: Assets.imagesNumber2,
                      label: AppStrings.factoryLocation,
                    ),
                    SizedBox(height: 12),
                    NextStep(
                      iconPath: Assets.imagesNumber3,
                      label: AppStrings.factoryDescription,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              CustomFormButton(
                innerText: AppStrings.editData,
                onTap: () => Navigator.pop(context),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
