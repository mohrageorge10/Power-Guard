import 'package:flutter/material.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';

class DebugMenuScreen extends StatelessWidget {
  const DebugMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = [
      {'name': 'Onboarding Screen', 'route': AppRoutes.onboardingScreen},
      {'name': 'Admin Main Screen', 'route': AppRoutes.adminMainScreen},
      {'name': 'Welcome Screen', 'route': AppRoutes.welcomeScreen},
       {'name': 'Login Screen', 'route': AppRoutes.loginScreen},
      {'name': 'Signup Screen', 'route': AppRoutes.signupScreen},
      {'name': 'Forgot Password', 'route': AppRoutes.forgotPasswordScreen},
      {'name': 'OTP Screen', 'route': AppRoutes.otpScreen},
      {'name': 'Register Factory', 'route': AppRoutes.registerFactoryScreen},
      {'name': 'Application Under Review', 'route': AppRoutes.applicationUnderReviewScreen},
      {'name': 'Home Screen', 'route': AppRoutes.homeScreen},
       {'name': 'Admin Home', 'route': AppRoutes.adminHomeScreen},
      {'name': 'Admin Factories', 'route': AppRoutes.adminFactoriesScreen},
      {'name': 'Admin Inbox', 'route': AppRoutes.adminInboxScreen},
      {'name': 'Department Home', 'route': AppRoutes.deptHomeScreen},
      {
        'name': 'Electricity Reading',
        'route': AppRoutes.electricityReadingScreen,
      },
      {'name': 'Report Issue', 'route': AppRoutes.reportIssueScreen},
      {'name': 'Department Emergency ', 'route': AppRoutes.emergencyAlertScreen},
      {'name': 'Factory Emergency ', 'route': AppRoutes.deptEmergencyScreen},
      {'name': 'Factory Manager', 'route': AppRoutes.factoryMangerScreen},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Navigation Menu'),
        backgroundColor: const Color(0xFF162685),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: routes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF162685),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, routes[index]['route']!),
            child: Text(
              routes[index]['name']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
    );
  }
}
