import 'package:dio/dio.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Networking/API/api_keys.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
  
    String? token = CacheHelper.getData(key: ApiKey.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}