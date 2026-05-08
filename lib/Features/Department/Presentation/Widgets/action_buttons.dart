
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Constants/assets.dart';
import 'package:power_guard/Features/Department/Presentation/Widgets/action_container.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionContainer(
            imagePath: Assets.imagesError,
            label: AppStrings.reportIssuesBtn,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionContainer(
            imagePath: Assets.imagesElectric2,
            label: AppStrings.enterEnergyBtn,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
