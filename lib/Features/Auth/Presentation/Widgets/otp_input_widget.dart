import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:power_guard/Core/Constants/app_colors.dart'; // تأكدي من مسار ألوانك

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
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
        // context.read<AuthCubit>().verifyOtp(pin);
      },
    );
  }
}
