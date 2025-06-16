import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/send_forget_password_model.dart';

class RequestResetPasswordController extends GetxController {
  final AuthService _authService = AuthService();

  SendForgetPasswordModel? otpResponse;
  bool isLoading = false;
  String? errorMessage;

  Future<void> sendEmail(String email) async {
    isLoading = true;
    errorMessage = null;
    update();
    try {
      final result = await _authService.sendEmail(email);
      if (result != null) {
        otpResponse = result;
      } else {
        errorMessage = result?.message ?? 'An error occurred while logging in';
      }
    } catch (e) {
      errorMessage = 'Failed to connect to server';
    }
    isLoading = false;
    update();
  }
}
