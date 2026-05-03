import 'package:dio/dio.dart';
// Adjust the path based on your project structure
import 'error_model.dart'; 

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    // =========================================================
    // 1. Internet connection errors (Server did not respond)
    // =========================================================
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(
          status: 0, 
          errorMsg: 'Please check your internet connection and try again.',
        ),
      );

    case DioExceptionType.badCertificate:
      throw ServerException(
        errorModel: ErrorModel(
          status: 0, 
          errorMsg: 'Invalid security certificate.',
        ),
      );

    case DioExceptionType.cancel:
      throw ServerException(
        errorModel: ErrorModel(
          status: 0, 
          errorMsg: 'Request was cancelled.',
        ),
      );

    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(
          status: 0, 
          errorMsg: 'An unexpected error occurred. Please try again later.',
        ),
      );

    // =========================================================
    // 2. Server errors (Server responded with an error)
    // =========================================================
    case DioExceptionType.badResponse:
      if (e.response != null && e.response!.data != null) {
        
        // If the response is a valid JSON (Map)
        if (e.response!.data is Map<String, dynamic>) {
          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        } else {
          // If the server returns HTML or unexpected format instead of JSON
          throw ServerException(
            errorModel: ErrorModel(
              status: e.response!.statusCode ?? 500,
              errorMsg: 'An error occurred in the server response.',
            ),
          );
        }
        
      } else {
        // If there is an error but the response body is empty
        throw ServerException(
          errorModel: ErrorModel(
            status: e.response?.statusCode ?? 500,
            errorMsg: 'Received an empty response from the server.',
          ),
        );
      }
  }
}