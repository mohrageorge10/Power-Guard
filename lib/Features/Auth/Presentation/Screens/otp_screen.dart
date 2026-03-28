import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/otp_input_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                BackArrow(),
                AuthHeader(
                  title: AppStrings.appName,
                  subtitle: AppStrings.enterOtp,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 66,
                  textColor: AppColors.primaryColor,
                ),
                OtpInputWidget(),
                SizedBox(height: 62),
                CustomFormButton(
                  innerText: AppStrings.confirm,
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.homeScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
