
import 'package:flutter/material.dart';
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
