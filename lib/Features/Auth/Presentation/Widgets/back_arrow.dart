
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:power_guard/Core/Constants/app_colors.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimaryColor,
            size: 24,
          ),
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
=======
import 'package:power_guard/Core/Constants/assets.dart';


class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(
          Assets.imagesArrowLeft,
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
>>>>>>> api
