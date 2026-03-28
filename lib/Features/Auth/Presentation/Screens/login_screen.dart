import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Widgets/auth_header.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/auth_question.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/back_arrow.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_form_button.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/custom_text_form_field.dart';
import 'package:power_guard/Features/Auth/Presentation/Widgets/forget_password_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authCubit = context.read<AuthCubit>();
    GlobalKey<FormState> logInFormKey = GlobalKey();
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
                  title: AppStrings.login,
                  subtitle: AppStrings.welcomeBack,
                ),

                const SizedBox(height: 40),

                Form(
                  key: logInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email
                      CustomTextFormField(
                        hintText: AppStrings.emailExample,
                        labelText: AppStrings.email,
                        // controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 22),
                      // Password
                      CustomTextFormField(
                        hintText: AppStrings.enterYourPassword,
                        labelText: AppStrings.password,
                        obscureText: true,
                        suffixIcon: true,
                        //  controller: context.read<UserCubit>().signInPassword,
                      ),

                      const SizedBox(height: 27),
                      //! Forget password?
                      Center(child: ForgetPasswordWidget()),
                      const SizedBox(height: 22),
                      //!Sign In Button
                      // state is SignInLoading
                      //     ? const CircularProgressIndicator():
                      CustomFormButton(
                        innerText: AppStrings.login,
                        onPressed: () {
                          //   context.read<UserCubit>().signIn();
                        },
                      ),
                      const SizedBox(height: 18),
                      //! Dont Have An Account ?
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
          ),
        ),
      ),
    );
  }
}
