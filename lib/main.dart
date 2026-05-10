import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Networking/API/dio_consumer.dart';
import 'package:power_guard/Core/Routing/app_router.dart';
import 'package:power_guard/Core/Routing/app_routes.dart';
import 'package:power_guard/Core/Theme/app_theme.dart';
import 'package:power_guard/Features/Auth/Data/Repo/auth_repository.dart';
import 'package:power_guard/Features/Auth/Presentation/cubit/auth_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthCubit(AuthRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.debugMenu,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
