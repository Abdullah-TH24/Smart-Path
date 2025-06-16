class SendForgetPasswordModel {
  final dynamic status;
  final String message;
  final int verificationCode;
  SendForgetPasswordModel({
    required this.status,
    required this.message,
    required this.verificationCode,
  });
}
