// // ini cntoh tanpa riverpod generator
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hooks_riverpod/legacy.dart';
// import '../../../../core/network/providers.dart';
// import '../../data/datasources/auth_remote_datasource.dart';
// import '../../data/repositories/auth_repository_impl.dart';

// // Provider untuk DataSource (MANUAL)
// final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
//   final dioClient = ref.watch(dioClientProvider);
//   return AuthRemoteDataSourceImpl(dioClient);
// });

// // Provider untuk Repository (MANUAL)
// final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
//   final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
//   return AuthRepositoryImpl(remoteDataSource);
// });

// // State untuk Register
// class RegisterState {
//   final bool isLoading;
//   final String? error;
  
//   RegisterState({this.isLoading = false, this.error});
// }

// // Notifier untuk Register (MANUAL)
// class RegisterNotifier extends StateNotifier<RegisterState> {
//   final Ref ref;
  
//   RegisterNotifier(this.ref) : super(RegisterState());
  
//   Future<void> register({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     state = RegisterState(isLoading: true);
    
//     try {
//       final repository = ref.read(authRepositoryProvider);
//       await repository.register(name: name, email: email, password: password);
//       state = RegisterState(isLoading: false);
//     } catch (e) {
//       state = RegisterState(isLoading: false, error: e.toString());
//     }
//   }
// }

// // Provider untuk Notifier (MANUAL)
// final registerNotifierProvider = StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
//   return RegisterNotifier(ref);
// });