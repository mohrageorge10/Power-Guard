import 'package:power_guard/Core/Networking/API/api_keys.dart';
import 'package:power_guard/Core/Networking/API/dio_consumer.dart';
import 'package:power_guard/Core/Networking/API/end_point.dart';
import 'package:power_guard/Features/Admin/Data/Models/admin_dashboard_model.dart';
import 'package:power_guard/Features/Admin/Data/Models/factory_model.dart';

class AdminRepository {
  final DioConsumer api;

  AdminRepository({required this.api});

  Future<AdminDashboardModel> getDashboardDetails() async {
    final response = await api.get(EndPoint.adminDashboard);
    
    return AdminDashboardModel.fromJson(response[ApiKey.data]); 
  }

  Future<List<FactoryModel>> getPendingFactories() async {
    final response = await api.get(EndPoint.adminPendingFactories);
    
    if (response is List) {
      return response.map((e) => FactoryModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<String> reviewFactory({
    required int factoryId, 
    required bool isApproved,
    String remarks = "No remarks", 
  }) async {
    final response = await api.put(
      EndPoint.adminReviewFactory,
      data: {
        ApiKey.factoryId: factoryId,
        ApiKey.isApproved: isApproved,
        ApiKey.remarks: remarks, 
      },
    );
    if (response is Map) {
      return response[ApiKey.msg] ?? "Action completed successfully";
    }
    return "Factory review updated successfully";
  }
}