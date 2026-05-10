import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Utils/app_validators.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/Cubit/auth_state.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/auth_question.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                FunctionsHelper.showSnackBar(
                  context,
                  message: AppStrings.registerSuccess,
                  isError: false,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.registerFactoryScreen,
                  (_) => false,
                );
              } else if (state is RegisterFailure) {
                FunctionsHelper.showSnackBar(context, message: state.errorMsg);
              }
            },
            builder: (context, state) {
              var cubit = context.read<AuthCubit>();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    BackArrow(),

                    const SizedBox(height: 20),

                    AuthHeader(
                      title: AppStrings.signUp,
                      subtitle: AppStrings.welcome,
                    ),

                    const SizedBox(height: 40),

                    Form(
                      key: cubit.registerFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          CustomTextFormField(
                            hintText: AppStrings.nameExample,
                            labelText: AppStrings.name,
                            controller: cubit.registerUserName,
                            validator: AppValidators.validateName,
                          ),
                          const SizedBox(height: 22),
                          // Email
                          CustomTextFormField(
                            hintText: AppStrings.emailExample,
                            labelText: AppStrings.email,
                            controller: cubit.registerEmail,
                            validator: AppValidators.validateEmail,
                          ),
                          const SizedBox(height: 22),
                          // Password
                          CustomTextFormField(
                            hintText: AppStrings.enterYourPassword,
                            labelText: AppStrings.password,
                            obscureText: true,
                            suffixIcon: true,
                            controller: cubit.registerPassword,
                            validator: AppValidators.validatePassword,
                          ),
                          const SizedBox(height: 22),
                          // Confirm Password
                          CustomTextFormField(
                            hintText: AppStrings.enterYourPassword,
                            labelText: AppStrings.confirmPassword,
                            obscureText: true,
                            suffixIcon: true,
                            controller: cubit.registerConfirmPassword,
                            validator: (value) => AppValidators.validateConfirmPassword(
                              value, 
                              cubit.registerPassword.text,
                            ),
                          ),
                          const SizedBox(height: 22),
                          // Phone
                          CustomTextFormField(
                            hintText: AppStrings.phoneExample,
                            labelText: AppStrings.phone,
                            controller: cubit.registerPhoneNumber,
                            validator: AppValidators.validatePhoneNumber,
                          ),

                          const SizedBox(height: 52),
                          // Register Button
                          state is RegisterLoading
                              ? Center(child: const CircularProgressIndicator())
                              : CustomFormButton(
                                  innerText: AppStrings.signUp,
                                  onTap: () {
                                    cubit.register();
                                  },
                                ),
                          const SizedBox(height: 18),
                          // Already Have An Account ?
                          AuthQuestion(
                            question: AppStrings.alreadyHaveAccount,
                            action: AppStrings.loginHere,
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.loginScreen,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
