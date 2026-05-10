import 'package:power_guard/Core/Networking/API/api_keys.dart';

class FactoryModel {
  final int id;
  final String name;
  final String location;
  final String description;
  final String managerName;
  final String managerEmail;

  FactoryModel({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.managerName,
    required this.managerEmail,
  });

  factory FactoryModel.fromJson(Map<String, dynamic> json) {
    return FactoryModel(
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      location: json[ApiKey.location] ?? '',
      description: json[ApiKey.description] ?? '',
      managerName: json[ApiKey.managerName] ?? '',
      managerEmail: json[ApiKey.managerEmail] ?? '',
    );
  }
}