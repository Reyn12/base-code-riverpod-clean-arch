import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'api_endpoints.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
      ..interceptors.add(
        LogInterceptor(
          request: true, // Print URL, method (GET/POST/dll)
          requestHeader: true, // Print header yang dikirim
          requestBody: true, // Print data yang dikirim (email, password, dll)
          responseHeader: true, // Print header response dari server
          responseBody: true, // Print data yang diterima dari server
          error: true, // Print error kalau ada
        ),
      )
      ..interceptors.add(AuthInterceptor());
  }

  // GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error Handler
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Koneksi timeout, coba lagi');

      case DioExceptionType.badResponse: // Status code 400-500
        final statusCode = error.response?.statusCode;
        final message = error.response?.data['message'] ?? 'Terjadi kesalahan';

        if (statusCode == 401) {
          // Unauthorized
          return ServerException(
            'Sesi habis, silakan login lagi',
            statusCode: 401,
          );
        }

        return ServerException(message, statusCode: statusCode);

      case DioExceptionType.connectionError: // Tidak ada koneksi internet
        return const NetworkException('Tidak ada koneksi internet');

      case DioExceptionType.cancel: // Request dibatalkan
        return const NetworkException('Request dibatalkan');

      default: // Default error
        return NetworkException(error.message ?? 'Terjadi kesalahan');
    }
  }
}
