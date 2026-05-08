import 'package:power_guard/Core/Networking/API/api_keys.dart';

class AuthModel {
  final String? token;
  final String? refreshToken;
  final String? expirationDate;
  final String? refreshTokenExpiration;
  final String message;
  final bool isSuccess;
  final int? factoryId;
  final int? departmentId;
  final String? userName;
  final String? role;
  final String? resetToken;

  AuthModel({
    this.token,
    this.refreshToken,
    this.expirationDate,
    this.refreshTokenExpiration,
    required this.message,
    required this.isSuccess,
    this.factoryId,
    this.departmentId,
    this.userName,
    this.role,
    this.resetToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json[ApiKey.token],
      refreshToken: json[ApiKey.refreshToken],
      expirationDate: json[ApiKey.expirationDate],
      refreshTokenExpiration: json[ApiKey.refreshTokenExpiration],
      message: json[ApiKey.errorMsg] ?? json[ApiKey.msg] ?? '',
      isSuccess: json[ApiKey.isSuccess] ?? false,
      factoryId: json[ApiKey.factoryId],
      departmentId: json[ApiKey.departmentId],
      userName: json[ApiKey.userName],
      role: json[ApiKey.role],
      resetToken: json[ApiKey.resetToken],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.token: token,
      ApiKey.refreshToken: refreshToken,
      ApiKey.expirationDate: expirationDate,
      ApiKey.refreshTokenExpiration: refreshTokenExpiration,
      ApiKey.isSuccess: isSuccess,
      ApiKey.factoryId: factoryId,
      ApiKey.departmentId: departmentId,
    };
  }
}
