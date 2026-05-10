import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Utils/app_validators.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_state.dart';
import 'package:power_guard/main.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    print("ResetPasswordScreen is now building...");
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              FunctionsHelper.showSnackBar(
                context,
                message: state.msg,
                isError: false,
              );

              FocusScope.of(context).unfocus();

              Future.delayed(const Duration(milliseconds: 300), () {
                if (!context.mounted) return;
                try {
                  print("🚀 Attempting to navigate to Login...");

                  cubit.loginEmail.clear();
                  cubit.loginPassword.clear();

                  navigatorKey.currentState?.popUntil((route) => route.isFirst);

                  print("✅ Navigation executed successfully");
                } catch (e, stackTrace) {
                  debugPrint("🚨 Navigation Crash Error: $e");
                  debugPrint("🚨 Stack Trace: $stackTrace");
                }
              });
            } else if (state is ResetPasswordFailure) {
              FunctionsHelper.showSnackBar(context, message: state.errorMsg);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: cubit.resetPasswordFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const BackArrow(),
                      const SizedBox(height: 20),

                      AuthHeader(
                        title: AppStrings.appName,
                        subtitle: AppStrings.createNewPassword,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 66,
                        textColor: AppColors.primaryColor,
                      ),

                      const SizedBox(height: 40),

                      // New Password Field
                      CustomTextFormField(
                        controller: cubit.newPasswordController,
                        hintText: AppStrings.enterYourPassword,
                        labelText: AppStrings.newPassword,
                        obscureText: true,
                        suffixIcon: true,
                      ),

                      const SizedBox(height: 22),

                      // Confirm Password Field
                      CustomTextFormField(
                        hintText: AppStrings.enterYourPassword,
                        labelText: AppStrings.confirmPassword,
                        obscureText: true,
                        suffixIcon: true,
                        validator: (value) =>
                            AppValidators.validateConfirmPassword(
                              value,
                              cubit.newPasswordController.text,
                            ),
                      ),

                      const SizedBox(height: 60),

                      state is ResetPasswordLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomFormButton(
                              innerText: AppStrings.confirm,
                              onTap: () {
                                if (cubit.resetPasswordFormKey.currentState!
                                    .validate()) {
                                  cubit.resetPassword();
                                }
                              },
                            ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
