import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

enum RowStatus { normal, critical }

class UsageTableRow extends StatelessWidget {
  final String time;
  final String value;
  final String consumption;
  final RowStatus status;

  const UsageTableRow({
    super.key,
    required this.time,
    required this.value,
    required this.consumption,
    required this.status,
  });

  bool get _isCritical => status == RowStatus.critical;

  Color get _timeColor => _isCritical ? AppColors.red : AppColors.pureBlack;
  Color get _valueColor => _isCritical ? AppColors.red : AppColors.primaryColor;


  Color get _consumptionColor => _isCritical ? AppColors.red : AppColors.greenKW;

  Color get _statusBgColor =>
      _isCritical ? AppColors.redButton : AppColors.greenButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              // Time
              Expanded(
                child: Text(
                  time,
                  style: TextStyle(
                    color: _timeColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Value — double line
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'kW',
                      style: TextStyle(
                        color: _valueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        color: _valueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Consumption
              Expanded(
                child: Text(
                  'kW $consumption',
                  style: TextStyle(
                    color: _consumptionColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Status Badge
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: _statusBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isCritical
                            ? Icons.warning_amber_outlined
                            : Icons.circle,
                        color: Colors.white.withAlpha(100),
                        size: 10,
                      ),
                      const SizedBox(width: 5),                       
                      Text(
                        _isCritical ? 'CRITICAL' : 'NORMAL',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Divider
        const Divider(
          color: Color(0xFFD0D5E8),
          thickness: 0.8,
          height: 0,
        ),
      ],
    );
  }
}