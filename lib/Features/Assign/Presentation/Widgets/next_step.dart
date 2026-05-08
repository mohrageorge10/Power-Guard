  import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class NextStep extends StatelessWidget {
       final String iconPath;
       final String label;

      const NextStep({super.key, 
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