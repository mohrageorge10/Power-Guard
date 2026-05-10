import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_state.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/reset_pass_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/otp_input_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            debugPrint("Current State: $state");
            if (state is VerifyOtpSuccess) {
              debugPrint("Navigation Triggered!");
              print("Success State Received! Token: ${state.resetToken}");
              FunctionsHelper.showSnackBar(
                context,
                message: state.msg,
                isError: false,
              );
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!context.mounted) return;
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              });
              print("Navigator Called!");
            } else if (state is VerifyOtpFailure) {
              print("Verify Failure: ${state.errorMsg}");
              FunctionsHelper.showSnackBar(context, message: state.errorMsg);
            }
          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const BackArrow(),
                    AuthHeader(
                      title: AppStrings.appName,
                      subtitle: AppStrings.enterOtp,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 66,
                      textColor: AppColors.primaryColor,
                    ),
                    const OtpInputWidget(), // Make sure this widget updates cubit.otpCode.text
                    const SizedBox(height: 62),
                    state is VerifyOtpLoading
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: AppStrings.confirm,
                            onTap: () {
                              cubit.verifyOtp();
                            },
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
