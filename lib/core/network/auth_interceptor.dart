import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Ambil token dari SharedPreferences
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Trigger logout disini
      // Hapus token & navigate ke login
    }
    handler.next(err);
  }
}