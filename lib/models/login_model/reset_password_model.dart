class ResetPasswordModel {
  final bool status;
  final String message;
  ResetPasswordModel({required this.status, required this.message});

  static ResetPasswordModel fromJson(Map map) {
    return ResetPasswordModel(status: map['status'], message: map['message']);
  }
}
