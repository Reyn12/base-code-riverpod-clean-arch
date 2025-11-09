class ApiEndpoints {
  // ============================================
  // ENVIRONMENT CONFIGURATION
  // ============================================
  // Ubah ini sesuai kebutuhan:
  // - Development: pakai Mockoon di emulator
  // - Production: pakai real API
  static const bool isDevelopment = true;

  static String get baseUrl {
    if (isDevelopment) {
      
      // Android Emulator - pakai 10.0.2.2
      return 'http://192.168.18.101:3001';
      

    } else {
      // Production - Real API
      return 'https://api.example.com';
    }
  }

  // ============================================
  // API ENDPOINTS
  // ============================================
  // Auth
  static const String register = '/auth/register';
}