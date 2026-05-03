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
<<<<<<< HEAD
    this.fontSize = 20,
=======
    this.fontSize,
    this.logo,

>>>>>>> api
  });
  final String title;
  final String subtitle;
  final Color? textColor;
  final Color? subtitleColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
<<<<<<< HEAD
=======
  final String? logo;

>>>>>>> api
  @override
  Widget build(BuildContext context) {
    final Color titleColor = textColor ?? AppColors.textPrimaryColor;
    final FontWeight font = fontWeight ?? FontWeight.w400;
    final double h = height ?? 0;
    return Center(
      child: Column(
        children: [
          Image.asset(Assets.imagesAppLogo, width: 85, height: 85),
<<<<<<< HEAD
          SizedBox(height: 38),
=======
          SizedBox(height: 40),
>>>>>>> api
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
<<<<<<< HEAD
          SizedBox(height: h),
=======
          SizedBox(height: 5),
>>>>>>> api
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: font,
              color: subtitleColor ?? AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
