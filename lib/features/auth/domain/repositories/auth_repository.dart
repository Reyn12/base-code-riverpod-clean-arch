/*
Ini file kontrak/blueprint/interface yang cuma ngasih tau:
1. Ada method apa aja
2. Parameter nya apa aja
3. Return nya apa aja

Note:
Disini gaada implementasi methodnya, cuma deklarasi aja.
Implementasi beneran ada di data/repositories/auth_repository_impl.dart
*/
abstract class AuthRepository {

  // Return String cuma berguna kalau message dari backend dinamis (misal ada validasi khusus). 
  // Return void biasanya kalo message dari backend statis (misal "Email sudah terdaftar")
  Future<void> register({
    required String name,
    required String email,
    required String password,
  });
}