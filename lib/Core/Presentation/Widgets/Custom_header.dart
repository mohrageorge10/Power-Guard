import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';


class CustomHeader extends StatelessWidget {
  final String title;
  final Widget trailing;


  const CustomHeader({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        trailing,
      ],
    );
  }
}