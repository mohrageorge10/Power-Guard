
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';

class InboxTitle extends StatelessWidget {
  const InboxTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.inboxTitle,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.viewAll,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
