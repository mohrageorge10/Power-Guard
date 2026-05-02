import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // FIX: Make PIN input sizes responsive based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final pinWidth =
        (screenWidth - 80) / 4; // Divide available width by 4 digits
    final clampedWidth = pinWidth.clamp(40.0, 56.0).toDouble();
    final clampedHeight = clampedWidth;

    final defaultPinTheme = PinTheme(
      width: clampedWidth,
      height: clampedHeight,
      textStyle: TextStyle(
        fontSize: clampedWidth * 0.4,
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.primaryColor, width: 3.0),
        ),
      ),
    );

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,

      onCompleted: (pin) {
        debugPrint('OTP: $pin');
      },
    );
  }
}
