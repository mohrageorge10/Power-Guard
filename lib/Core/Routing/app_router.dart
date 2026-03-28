import 'package:flutter/material.dart';
import 'package:power_guard/Core/Presentation/welcome_screen.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/forgot_password_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/login_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/otp_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/role_selection_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/signup_screen.dart';
import 'package:power_guard/home.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutes.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppRoutes.roleScreen:
        return MaterialPageRoute(builder: (context) => const RoleSelectionScreen());
      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
      case AppRoutes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OTPScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No route defined for ${settings.name}"),
              ),
            );
          },
        );
    }
  }
}
