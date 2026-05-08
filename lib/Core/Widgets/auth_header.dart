import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.textColor,
    this.fontWeight,
    this.height,
    this.subtitleColor,
    this.fontSize,
    this.logo,

  });
  final String title;
  final String subtitle;
  final Color? textColor;
  final Color? subtitleColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final String? logo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(Assets.imagesAppLogo, width: 85, height: 85),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor ?? AppColors.textPrimaryColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: subtitleColor ?? AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
