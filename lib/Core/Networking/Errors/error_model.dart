import 'package:power_guard/Core/Networking/API/api_keys.dart';

class ErrorModel {
  final int status;
  final String errorMsg;

  ErrorModel({required this.status, required this.errorMsg});
  // عشان احول json لللمودل بتاعي
  factory ErrorModel.fromJson(dynamic jsonData) {
    // لو الرد راجع JSON (Map) زي حالة الـ Register اللي فاتت
    if (jsonData is Map<String, dynamic>) {
      return ErrorModel(
        status: jsonData[ApiKey.status] ?? 400,
        errorMsg:
            jsonData[ApiKey.msg] ??
            jsonData[ApiKey.errorMsg] ??
            'An error occurred',
      );
    } else {
      // لو الرد راجع نص عادي (String) زي حالة الـ Login دي
      return ErrorModel(
        status: 401,
        errorMsg: jsonData.toString(), // هياخد "Invalid email or password"
      );
    }
  }
}
