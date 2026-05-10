import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Routing/navigation_decider.dart';
import 'package:power_guard/Core/Utils/app_validators.dart';
import 'package:power_guard/Core/Utils/functions_helper.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/auth_question.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/forget_password_widget.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("👀 LoginScreen Scaffold is on the screen!");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                FunctionsHelper.showSnackBar(
                  context,
                  message: AppStrings.loginSuccess,
                  isError: false,
                );
                NavigationDecider.navigateBasedOnRole(context, state.role);
              } else if (state is LoginFailure) {
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
                    const SizedBox(height: 20),

                    AuthHeader(
                      title: AppStrings.login,
                      subtitle: AppStrings.welcomeBack,
                    ),

                    const SizedBox(height: 40),

                    Form(
                      key: cubit.loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email
                          CustomTextFormField(
                            hintText: AppStrings.emailExample,
                            labelText: AppStrings.email,
                            controller: cubit.loginEmail,
                            validator: AppValidators.validateEmail,
                          ),
                          const SizedBox(height: 22),
                          // Password
                          CustomTextFormField(
                            hintText: AppStrings.enterYourPassword,
                            labelText: AppStrings.password,
                            obscureText: true,
                            suffixIcon: true,
                            controller: cubit.loginPassword,
                            validator: (value) => AppValidators.validateEmpty(
                              value,
                              AppStrings.password,
                            ),
                          ),

                          const SizedBox(height: 27),
                          const Center(child: ForgetPasswordWidget()),
                          const SizedBox(height: 22),

                          // Login Button
                          state is LoginLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomFormButton(
                                  innerText: AppStrings.login,
                                  onTap: () {
                                    if (cubit.loginFormKey.currentState!
                                        .validate()) {
                                      cubit.login();
                                    }
                                  },
                                ),
                          const SizedBox(height: 18),

                          AuthQuestion(
                            question: AppStrings.dontHaveAccount,
                            action: AppStrings.registerNow,
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.signupScreen,
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
