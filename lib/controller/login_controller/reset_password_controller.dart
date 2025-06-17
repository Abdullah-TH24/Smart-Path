import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/reset_password_model.dart';

class ResetPasswordController extends GetxController {
  final AuthService _authService = AuthService();

  ResetPasswordModel? resetResponse;
  bool isLoading = false;
  String? errorMessage;

  Future<void> resetPassword(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    update();
    try {
      log('11');
      final result = await _authService.resetPassword(email, password);
      log('111');
      if (result != null) {
        log('22');
        resetResponse = result;
      }
    } catch (e) {
      log('33 $e');
      e.printError();
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
