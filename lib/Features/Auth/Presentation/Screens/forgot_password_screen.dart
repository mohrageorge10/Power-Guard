import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_state.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // Success Case
            if (state is ForgetPasswordSuccess) {
              FunctionsHelper.showSnackBar(context, message: state.msg, isError: false);
              // Navigate to OTP Screen automatically after sending the code
              Navigator.pushNamed(context, AppRoutes.otpScreen);
            } 
            // Failure Case
            else if (state is ForgetPasswordFailure) {
              FunctionsHelper.showSnackBar(context, message: state.errorMsg);
            }
          },
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();

            return SingleChildScrollView(
              child: Center(
                // Added Form widget to use the form key for validation
                child: Form(
                  key: authCubit.passwordRecoveryFormKey,
                  child: Column(
                    children: [
                      const BackArrow(),
                      const SizedBox(height: 30),
                       AuthHeader(
                        title: AppStrings.appName,
                        subtitle: AppStrings.enterYourEmail,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 66,
                        textColor: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 12),
                      
                      // Bind the controller from the Cubit
                      CustomTextFormField(
                        controller: authCubit.resetEmail, 
                        hintText: AppStrings.emailExample,
                        labelText: "",
                        // Optional: Add validator if CustomTextFormField supports it
                        // validator: (value) => value!.isEmpty ? "Required" : null,
                      ),
                      
                      const SizedBox(height: 60),
                      
                      // Show loading indicator when the API is being called
                      state is ForgetPasswordLoading
                          ? const CircularProgressIndicator()
                          : CustomFormButton(
                              innerText: AppStrings.confirm,
                              onTap: () {
                                // Validate the form before sending the request
                                if (authCubit.passwordRecoveryFormKey.currentState!.validate()) {
                                  authCubit.forgetPassword();
                                }
                              },
                            ),
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