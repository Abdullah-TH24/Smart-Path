import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/user_model.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService(); //test

  UserModel? loginResponse;
  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    update();
    try {
      final result = await _authService.login(email, password);
      if (result != null) {
        loginResponse = result;
      }
    } catch (e) {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
