import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/auth_question.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpFormKey = GlobalKey();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                  key: signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      CustomTextFormField(
                        hintText: AppStrings.nameExample,
                        labelText: AppStrings.name,
                        // controller: context.read<UserCubit>().signUpName,
                      ),
                      const SizedBox(height: 22),
                      // Email
                      CustomTextFormField(
                        hintText: AppStrings.emailExample,
                        labelText: AppStrings.email,
                        // controller: context.read<UserCubit>().signIUpEmail,
                      ),
                      const SizedBox(height: 22),
                      // Password
                      CustomTextFormField(
                        hintText: AppStrings.enterYourPassword,
                        labelText: AppStrings.password,
                        obscureText: true,
                        suffixIcon: true,
                        //  controller: context.read<UserCubit>().signUpPassword,
                      ),
                      const SizedBox(height: 22),
                      // Phone
                      CustomTextFormField(
                        hintText: AppStrings.phoneExample,
                        labelText: AppStrings.phone,
                        // controller: context.read<UserCubit>().signUpPhone,
                      ),

                      const SizedBox(height: 52),
                      //!Sign In Button
                      // state is SignInLoading
                      //     ? const CircularProgressIndicator():
                      CustomFormButton(
                        innerText: AppStrings.signUp,
                        onPressed: () {
                          //   context.read<UserCubit>().signUp();
                        },
                      ),
                      const SizedBox(height: 18),
                      // Already Have An Account ?
                      AuthQuestion(
                        question: AppStrings.alreadyHaveAccount,
                        action: AppStrings.loginHere,
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.loginScreen),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
