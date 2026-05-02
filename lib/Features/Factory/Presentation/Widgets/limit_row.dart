import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class LimitRow extends StatelessWidget {
  final String name;
  final String limit;
  final IconData icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const LimitRow({
    super.key,
    required this.name,
    required this.limit,
    required this.icon,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.primary100Color,
        child: Icon(icon, color: AppColors.primaryColor),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Max: $limit'),
      trailing: Switch(
        value: value,
        onChanged: onChanged ?? (bool v) {},
        activeTrackColor: AppColors.primaryColor,
      ),
    );
  }
}
