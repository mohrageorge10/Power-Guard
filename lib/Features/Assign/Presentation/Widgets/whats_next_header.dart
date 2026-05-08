
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class WhatsNextHeader extends StatelessWidget {
  const WhatsNextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesSubmitP, width: 20, height: 20),
        const SizedBox(width: 8),
         Text(
          AppStrings.whatsNext,
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

     