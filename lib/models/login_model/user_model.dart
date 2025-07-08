class UserModel {
  final bool status;
  final String message;
  final String role;
  UserModel({required this.status, required this.message, required this.role});

  static UserModel fromJson(Map map) {
    return UserModel(
      status: map['status'],
      message: map['message'],
      role: map['role'],
    );
  }
}
