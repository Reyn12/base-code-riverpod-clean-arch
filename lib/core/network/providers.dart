import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dio_client.dart';

part 'providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
DioClient dioClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio);
}