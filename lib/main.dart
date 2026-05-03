import 'package:flutter/material.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Routing/app_router.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.debugMenu,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
