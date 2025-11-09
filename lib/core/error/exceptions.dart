/*
- ServerException - Pas API return error (status code 400-500)
- NetworkException - Pas ga ada internet / timeout / connection error
- CacheException - Pas error baca/tulis local storage (SharedPreferences)
*/
class ServerException implements Exception {
  final String message;
  final int? statusCode;
  
  const ServerException(this.message, {this.statusCode});
}

class NetworkException implements Exception {
  final String message;
  
  const NetworkException(this.message);
}

class CacheException implements Exception {
  final String message;
  
  const CacheException(this.message);
}