import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class KpiCard extends StatelessWidget {
  final String? value;
  final String label;
  final String? iconAsset;
  final Widget? trailing;
  final Color? backgroundColor;
  final double? height;
  final double? valueFontSize;
  final double? labelFontSize;
  final Border? border;
  final VoidCallback? onTap;

  const KpiCard({
    super.key,
    this.value,
    required this.label,
    this.iconAsset,
    this.trailing,
    this.backgroundColor,
    this.height,
    this.valueFontSize,
    this.labelFontSize,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 140,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(80),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     if (iconAsset != null && iconAsset!.isNotEmpty)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            iconAsset!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else if (iconAsset == "")
                      const SizedBox(height: 43),
                      const SizedBox(height: 40),

                    if (trailing != null) Flexible(child: trailing!),
                  ],
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (value != null)
                        Text(
                          value!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: valueFontSize ?? 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        label,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withAlpha(220),
                          fontSize: labelFontSize ?? 13,
                          fontWeight: value == null ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

   static Widget buildKpiRow({
    String? value1,
    required String label1,
    String? icon1,
    Widget? trailing1,
    Color? color1,
    double? valueFontSize1,
    double? labelFontSize1,
    Border? border1,
    String? value2,
    required String label2,
    String? icon2,
    Widget? trailing2,
    Color? color2,
    double? valueFontSize2,
    double? labelFontSize2,
    Border? border2,
    double? height,
  }) {
    return Row(
      children: [
        Expanded(
          child: KpiCard(
            value: value1,
            label: label1,
            iconAsset: icon1,
            trailing: trailing1,
            backgroundColor: color1,
            border: border1,
            height: height,
            valueFontSize: valueFontSize1,
            labelFontSize: labelFontSize1,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: KpiCard(
            value: value2,
            label: label2,
            iconAsset: icon2,
            trailing: trailing2,
            backgroundColor: color2,
            border: border2,
            height: height,
            valueFontSize: valueFontSize2,
            labelFontSize: labelFontSize2,
          ),
        ),
      ],
    );
  }
}

Widget buildKpiBadge(String text, {Color? textColor}) {
  return Container(
     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),

    decoration: BoxDecoration(
       color: AppColors.lightBg,
      borderRadius: BorderRadius.circular(8.5),
      border: Border.all(color: Colors.white, width: 1),

       boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor ?? AppColors.primaryColor,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

 Widget buildCompactKpiCard({
  required String value,
  required String label,
  Color? color,
  Border? border,
  double height = 100,
}) {
  return Container(
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: color ?? const Color(0xFF162685),
      borderRadius: BorderRadius.circular(20),
      border: border,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SizedBox(height: 15),
        Text(
          value,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}