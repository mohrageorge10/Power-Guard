import 'package:power_guard/Core/Networking/API/api_keys.dart';

class AdminDashboardModel {
  final int totalFactories;
  final int pendingFactories;
  final int activeFactories;

  AdminDashboardModel({
    required this.totalFactories,
    required this.pendingFactories,
    required this.activeFactories,
  });

  factory AdminDashboardModel.fromJson(Map<String, dynamic> json) {
    return AdminDashboardModel(
      totalFactories: json[ApiKey.totalFactories] ?? 0,
      pendingFactories: json[ApiKey.pendingFactories] ?? 0,
      activeFactories: json[ApiKey.activeFactories] ?? 0,
    );
  }
}