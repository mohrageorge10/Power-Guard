import 'package:flutter/material.dart';
import '../../../../Core/Constants/app_strings.dart';
import '../../../../Core/Constants/app_colors.dart';


class OnboardingModel {
  final String title;
  final String subTitle;
  final String buttonText;
  final Color? pageColor;

  const OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.buttonText,
    this.pageColor,
  });

  static List<OnboardingModel> onboardingList = [
    const OnboardingModel(
      title: AppStrings.onboardingTitle1,
      subTitle: AppStrings.onboardingSubTitle1,
      buttonText: AppStrings.onboardingGetStarted,
      pageColor: AppColors.onBoardingBlue1,
    ),
    const OnboardingModel(
      title: AppStrings.onboardingTitle2,
      subTitle: AppStrings.onboardingSubTitle2,
      buttonText: AppStrings.next,
      pageColor: AppColors.onBoardingBlue2,
    ),
    const OnboardingModel(
      title: AppStrings.onboardingTitle3,
      subTitle: AppStrings.onboardingSubTitle3,
      buttonText: AppStrings.next,
      pageColor: AppColors.onBoardingBlue3,
    ),
    const OnboardingModel(
      title: AppStrings.onboardingTitle4,
      subTitle: AppStrings.onboardingSubTitle4,
      buttonText: AppStrings.explorePowerGuard,
      pageColor: AppColors.primaryColor,
    ),
  ];
}