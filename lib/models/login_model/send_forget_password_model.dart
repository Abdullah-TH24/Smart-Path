class SendForgetPasswordModel {
  final dynamic status;
  final String message;
  SendForgetPasswordModel({required this.status, required this.message});

  static SendForgetPasswordModel fromJson(Map map) {
    return SendForgetPasswordModel(
      status: map['status'],
      message: map['message'],
    );
  }
}
