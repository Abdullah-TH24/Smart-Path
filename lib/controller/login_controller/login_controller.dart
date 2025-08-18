import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/user_model.dart';

class LoginController extends GetxController {
  final LoginServices _authService = LoginServices(); //test

  UserModel? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    response = null;
    update();
    final result = await _authService.login(email, password);

    if (result != null) {
      log(result.role);
      // log(prefs!.getString('token')!);
      response = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
