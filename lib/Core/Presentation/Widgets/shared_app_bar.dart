import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/assets.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userImage;

  const SharedAppBar({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(125);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      toolbarHeight: 125,
      shape: const Border(
        bottom: BorderSide(color: AppColors.primary50Color, width: 1.5),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(Assets.imagesArrowLeft, height: 35, width: 35),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: Image.asset(
                  Assets.imagesFactoryManger,
                  height: 40,
                  width: 40,
                ).image,
                onBackgroundImageError: (_, _) {},
              ),
              const SizedBox(width: 10),
              Text(
                userName,
                style: const TextStyle(
                  color: AppColors.textPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesFluentAlert, height: 22.5, width: 22.5),
              const Text(
                'Alerts',
                style: TextStyle(
                  color: AppColors.warningOrange,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
