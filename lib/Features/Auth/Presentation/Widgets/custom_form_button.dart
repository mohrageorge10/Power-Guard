import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final String? img;

  const CustomFormButton({
    super.key,
    required this.innerText,
    required this.onTap,
    this.width,
    this.height,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? 50),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          elevation: 5,
          shadowColor: Colors.black.withValues(alpha: 0.5),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (img != null) ...[
                Image.asset(img!, width: 24, height: 24),
                const SizedBox(width: 10),
              ],
              Text(
                innerText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
