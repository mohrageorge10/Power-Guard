
import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class UsageTableHeader extends StatelessWidget {
  const UsageTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              '(TIME)',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
    
          Expanded(
            child: Text(
              '(VALUE)',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
    
          Expanded(
            child: Text(
              '(CONSUMPTION)',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Expanded(
            child: Text(
              '(STATUS)',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
