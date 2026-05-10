import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Networking/API/dio_consumer.dart';
import 'package:power_guard/Core/Presentation/debug_menu_screen.dart';
import 'package:power_guard/Core/Presentation/welcome_screen.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_factories_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_home_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_inbox_screen.dart';
import 'package:power_guard/Features/Admin/Presentation/Screens/admin_main_screen.dart';
import 'package:power_guard/Features/Assign/Data/Repo/assign_repository.dart';
import 'package:power_guard/Features/Assign/Presentation/cubit/assign_cubit.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/forgot_password_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/login_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/otp_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/reset_pass_screen.dart';
import 'package:power_guard/Features/Auth/Presentation/Screens/signup_screen.dart';
import 'package:power_guard/Features/Department/Presentation/Screens/dept_emergency_screen.dart';
import 'package:power_guard/Features/Department/Presentation/Screens/dept_home_screen.dart';
import 'package:power_guard/Features/Department/Presentation/Screens/electricity_reading_screen.dart';
import 'package:power_guard/Features/Department/Presentation/Screens/report_issue_screen.dart';
import 'package:power_guard/Features/Factory/Presentation/Screens/factory_emergency_screen.dart';
import 'package:power_guard/Features/Factory/Presentation/Screens/factory_manger_screen.dart';

import '../../Features/Assign/Presentation/Screens/app_under_review_screen.dart';
import '../../Features/Assign/Presentation/Screens/register_factory_screen.dart';
import '../../Features/Onboarding/Presentation/Screens/onboarding_screen.dart';
import '../Presentation/Widgets/emergency_alert_screen.dart'
    show EmergencyAlertScreen;

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.debugMenu:
        return MaterialPageRoute(builder: (context) => const DebugMenuScreen());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutes.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppRoutes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );

      case AppRoutes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OTPScreen());

      case AppRoutes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      case AppRoutes.registerFactoryScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                AssignCubit(AssignRepository(api: DioConsumer(dio: Dio()))),
            child: const RegisterFactoryScreen(),
          ),
        );

      case AppRoutes.applicationUnderReviewScreen:
        return MaterialPageRoute(
          builder: (context) => const ApplicationUnderReviewScreen(
            factoryName: '',
            factoryLocation: '',
            factoryDescription: '',
          ),
        );

      case AppRoutes.adminHomeScreen:
        return MaterialPageRoute(builder: (context) => const AdminHomeScreen());

      case AppRoutes.adminFactoriesScreen:
        return MaterialPageRoute(
          builder: (context) => const AdminFactoriesScreen(),
        );

      case AppRoutes.adminInboxScreen:
        return MaterialPageRoute(
          builder: (context) => const AdminInboxScreen(),
        );

      case AppRoutes.electricityReadingScreen:
        return MaterialPageRoute(
          builder: (context) => const ElectricityReadingScreen(),
        );

      case AppRoutes.reportIssueScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportIssueScreen(),
        );

      case AppRoutes.emergencyAlertScreen:
        return MaterialPageRoute(
          builder: (context) => const EmergencyAlertScreen(),
        );
      case AppRoutes.deptEmergencyScreen:
        return MaterialPageRoute(
          builder: (context) => const DeptEmergencyScreen(),
        );

      case AppRoutes.factoryMangerScreen:
        return MaterialPageRoute(
          builder: (context) => const FactoryManagerScreen(),
        );

      case AppRoutes.factoryEmergencyScreen:
        return MaterialPageRoute(
          builder: (context) => const FactoryEmergencyScreen(),
        );

      case AppRoutes.adminMainScreen:
        return MaterialPageRoute(builder: (context) => AdminMainScreen());

      case AppRoutes.deptHomeScreen:
        return MaterialPageRoute(builder: (context) => const DeptHomeScreen());
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
