import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';
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
                  children: const [
                    _WhatsNextHeader(),
                    SizedBox(height: 16),
                    _NextStep(
                      iconPath: Assets.imagesNumber1,
                      label: 'Factory location',
                    ),
                    SizedBox(height: 12),
                    _NextStep(
                      iconPath: Assets.imagesNumber2,
                      label: 'Factory description',
                    ),
                    SizedBox(height: 12),
                    _NextStep(
                      iconPath: Assets.imagesNumber3,
                      label: 'Factory description',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              CustomFormButton(
                innerText: 'Edit data',
                onPressed: () => Navigator.pop(context),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ---- Whats Next Header ----

class _WhatsNextHeader extends StatelessWidget {
  const _WhatsNextHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesSubmitP, width: 20, height: 20),
        const SizedBox(width: 8),
        const Text(
          "What's next?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}

       class _NextStep extends StatelessWidget {
       final String iconPath;
       final String label;

      const _NextStep({
      required this.iconPath,
      required this.label,
    });

    @override
    Widget build(BuildContext context) {
    return Row(
      children: [

        Image.asset(iconPath, width: 24, height: 24),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}