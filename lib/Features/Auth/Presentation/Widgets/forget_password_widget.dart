import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen),
      child: Text(
        AppStrings.forgotPassword,
        style: TextStyle(
          fontSize: 16,
          color: Color(0XFF0EA5E9),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
