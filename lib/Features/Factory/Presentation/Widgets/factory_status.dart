import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';


class InfoStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String iconPath;
  final Color backgroundColor;
  final Color contentColor;

  const InfoStatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconPath,
    this.backgroundColor = Colors.white,
    this.contentColor = const Color(0xFF8F99CC),
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: AppColors.accentBlue.withAlpha(90), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                  color: contentColor
              )
          ),
          const SizedBox(height: 12),
          Row(
            children: [
               Image.asset(
                iconPath,
                width: 18,
                height: 18,
               ),
              const SizedBox(width: 8),
              Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.distributionYellow.withAlpha(230),
                       fontWeight: FontWeight.w600

                  )
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: contentColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}