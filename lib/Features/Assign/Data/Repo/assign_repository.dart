import 'package:power_guard/Core/Networking/API/api_consumer.dart';
import 'package:power_guard/Core/Networking/API/api_keys.dart';
import 'package:power_guard/Core/Networking/API/end_point.dart';

class AssignRepository {
  final ApiConsumer api;

  AssignRepository({required this.api});

  Future<void> registerFactory({
    required String name,
    required String location,
    required String description,
  }) async {
    await api.post(
      EndPoint.factory,
      data: {
        ApiKey.name: name,
        ApiKey.factoryAddress: location,
        ApiKey.description: description,
        ApiKey.currentConsumptionLimit: 0,
      },
    );
  }
}
