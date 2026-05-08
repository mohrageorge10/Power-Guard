
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class InboxHeader extends StatelessWidget {
  const InboxHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesInbox, height: 22, width: 22),
        const SizedBox(width: 10),
        Text(
          AppStrings.inboxCount,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
