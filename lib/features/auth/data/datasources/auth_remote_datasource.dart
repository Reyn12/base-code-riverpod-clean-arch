import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Bikin request model
      final requestModel = RegisterRequestModel(
        name: name,
        email: email,
        password: password,
      );

      // Hit API
      final response = await dioClient.post(
        ApiEndpoints.register,
        data: requestModel.toJson(),
      );

      // Convert response jadi model
      return RegisterResponseModel.fromJson(response.data);
    } on ServerException {
      rethrow;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw ServerException('Terjadi kesalahan tidak terduga');
    }
  }
}