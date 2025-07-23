import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smartpath/core/services/auth_services/auth_services.dart';

class AuthController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final LocalAuthentication auth = LocalAuthentication();
  final TextEditingController controller = TextEditingController();

  bool biometricAvailable = false;

  bool? resCheck;
  bool isLoading = false;
  String? errorMessage;

  Future<void> _checkBiometricAvailability() async {
    try {
      final bool available = await auth.canCheckBiometrics;
      biometricAvailable = available;
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    _checkBiometricAvailability();
    super.onInit();
  }

  Future checkPinCode(String token, String pinCode) async {
    isLoading = true;
    errorMessage = null;
    resCheck = null;
    update();
    final bool? result = await _authServices.checkPinCode(token, pinCode);
    if (result != null) {
      resCheck = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }

  loading() {
    isLoading = true;
    update();
  }

  stopLoading() {
    isLoading = false;
    update();
  }
}
