import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/providers.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';

part 'register_provider.g.dart';

// Provider untuk DataSource (Data layer)
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthRemoteDataSourceImpl(dioClient);
}

// Provider untuk Repository Implement (Data layer)
@riverpod
AuthRepositoryImpl authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}

// Notifier untuk Register (State Management)
@riverpod
class RegisterNotifier extends _$RegisterNotifier {

  // Ini first screen dibuat lgsung ke trigger
  @override
  FutureOr<void> build() {
    // Initial state kosong
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // Set loading
    state = const AsyncValue.loading();

    await Future.delayed(const Duration(seconds: 1));

    // Execute
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      await repository.register(
        name: name,
        email: email,
        password: password,
      );
    });
  }
}