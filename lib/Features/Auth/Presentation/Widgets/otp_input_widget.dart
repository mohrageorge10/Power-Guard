import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_cubit.dart';

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

    // Get the cubit instance
    final cubit = context.read<AuthCubit>();

    return Pinput(
      length: 6, // Make sure your backend expects a 6-digit OTP
      controller: cubit.otpCode, // 👈 THE FIX: Linking the controller here!
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: (pin) {
        debugPrint('OTP: $pin');
        // Call verifyOtp without arguments, it will read from the linked controller
        cubit.verifyOtp();
      },
    );
  }
}
