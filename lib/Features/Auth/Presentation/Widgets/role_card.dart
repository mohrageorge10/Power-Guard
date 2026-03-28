
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Presentation/Widgets/feature_card.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return FeatureCard(
      imagePath: imagePath,
      title: title,
      description: description,
      subTitleColor: AppColors.textSubTitleColor,
      fSize: 16,
      titleColor: AppColors.textPrimaryColor,
      height: 10,
      link: true,
      linkText: AppStrings.explore,
      cardHeight: 250,
    );
  }
}
