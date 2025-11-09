class RegisterResponseModel {
  final String message;
  final UserData? data;

  RegisterResponseModel({
    required this.message,
    this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'] as String,
      data: json['data'] != null 
          ? UserData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;

  UserData({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}