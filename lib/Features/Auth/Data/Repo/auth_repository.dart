import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Networking/API/api_keys.dart';
import 'package:power_guard/Core/Networking/API/dio_consumer.dart';
import 'package:power_guard/Core/Networking/API/end_point.dart';
import 'package:power_guard/Features/Auth/Data/Models/auth_model.dart';


class AuthRepository {
  final DioConsumer api;

  AuthRepository({required this.api});

  // 1. Login
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await api.post(
      EndPoint.login,
      data: {ApiKey.email: email, ApiKey.password: password},
    );
    final authModel = AuthModel.fromJson(response);

    // Save tokens and role if login/register is successful
    if (authModel.isSuccess && authModel.token != null) {
      await CacheHelper.saveData(key: ApiKey.token, value: authModel.token);

      if (authModel.role != null && authModel.role!.isNotEmpty) {
        await CacheHelper.saveData(key: ApiKey.role, value: authModel.role);
      }

      if (authModel.refreshToken != null &&
          authModel.refreshToken!.isNotEmpty) {
        await CacheHelper.saveData(
          key: ApiKey.refreshToken,
          value: authModel.refreshToken,
        );
      }
    }
    return authModel;
  }

  // 2. Register
  Future<AuthModel> register({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    final response = await api.post(
      EndPoint.register,
      data: {
        ApiKey.userName: userName,
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.confirmPassword: confirmPassword,
        ApiKey.phoneNumber: phoneNumber,
      },
    );
    final authModel = AuthModel.fromJson(response);

    // Save tokens and role if login/register is successful
    if (authModel.isSuccess && authModel.token != null) {
      await CacheHelper.saveData(key: ApiKey.token, value: authModel.token);

      if (authModel.role != null && authModel.role!.isNotEmpty) {
        await CacheHelper.saveData(key: ApiKey.role, value: authModel.role);
      }

      if (authModel.refreshToken != null &&
          authModel.refreshToken!.isNotEmpty) {
        await CacheHelper.saveData(
          key: ApiKey.refreshToken,
          value: authModel.refreshToken,
        );
      }
    }
    return authModel;
  }

  // 3. Refresh Token
  Future<AuthModel> refreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    final response = await api.post(
      EndPoint.refreshToken,
      data: {
        ApiKey.accessToken: accessToken, 
        ApiKey.refreshToken: refreshToken,
      },
    );
    final authModel = AuthModel.fromJson(response);

    if (authModel.isSuccess && authModel.token != null) {
      await CacheHelper.saveData(key: ApiKey.token, value: authModel.token);

      if (authModel.refreshToken != null &&
          authModel.refreshToken!.isNotEmpty) {
        await CacheHelper.saveData(
          key: ApiKey.refreshToken,
          value: authModel.refreshToken,
        );
      }
    }
    return authModel;
  }

  // 4. Logout
  Future<void> logout({required String token}) async {
    try {
      await api.post(
        EndPoint.logout,
        data: token, 
      );
    } finally {
      // We use 'finally' to ensure local data is cleared 
      // even if the server request fails (e.g., no internet)
      
      await CacheHelper.removeData(key: ApiKey.token);
      await CacheHelper.removeData(key: ApiKey.refreshToken);
      await CacheHelper.removeData(key: ApiKey.role);
    }
  }

  // 5. Revoke Token
  Future<void> revokeToken({required String token}) async {
    await api.post(
      EndPoint.revokeToken,
      data: token, // Sent as a direct string
    );
  }

  // 6. Forget Password
  Future<String> forgetPassword({required String email}) async {
    final response = await api.post(
      EndPoint.forgetPassword,
      data: {ApiKey.email: email},
    );
    return response[ApiKey.msg] ?? AppStrings.otpSent;
  }

  // 7. Verify OTP
  Future<String> verifyOtp({required String email, required String otp}) async {
    final response = await api.post(
      EndPoint.verifyOtp,
      data: {ApiKey.email: email, ApiKey.otp: otp},
    );
    return response[ApiKey.resetToken];
  }

  // 8. Reset Password
  Future<String> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    final response = await api.post(
      EndPoint.resetPassword,
      data: {
        ApiKey.email: email,
        ApiKey.resetToken: resetToken, 
        ApiKey.newPassword: newPassword,
      },
    );
    return response[ApiKey.msg] ?? AppStrings.passwordResetSuccess;
  }
}
