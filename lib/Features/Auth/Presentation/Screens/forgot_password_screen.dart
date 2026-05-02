import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                BackArrow(),
                SizedBox(height: 30),
                AuthHeader(
                  title: AppStrings.appName,
                  subtitle: AppStrings.enterYourEmail,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 66,
                  textColor: AppColors.primaryColor,
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  hintText: AppStrings.emailExample,
                  labelText: "",
                ),
                SizedBox(height: 60),
                CustomFormButton(
                  innerText: AppStrings.confirm,
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.otpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
