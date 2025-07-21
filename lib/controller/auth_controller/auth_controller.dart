import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smartpath/main.dart';

class AuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  String pin = '';
  final TextEditingController controller = TextEditingController();
  bool biometricAvailable = false;
  bool isLoading = false;

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
    pin = prefs!.getString('pin_code')!;
    _checkBiometricAvailability();
    super.onInit();
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
