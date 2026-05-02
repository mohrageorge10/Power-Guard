import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.subTitleColor,
    this.titleColor,
    this.fSize,
    this.height = 23,
    required this.link,
    this.linkText,
    this.cardHeight = 218,
  });
  final String imagePath;
  final String title;
  final String description;
  final Color? subTitleColor;
  final Color? titleColor;
  final double? fSize;
  final double? cardHeight;
  final double? height;
  final bool link;
  final String? linkText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: cardHeight,
      constraints: const BoxConstraints(maxWidth: 379),
      decoration: BoxDecoration(
        color: AppColors.primary50Color,
        borderRadius: BorderRadius.circular(38),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 40.0, width: 38.0),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fSize ?? 20,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: height),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: subTitleColor ?? AppColors.textPrimaryColor,
                  ),
                ),
                link
                    ? Flexible(
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                linkText ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
