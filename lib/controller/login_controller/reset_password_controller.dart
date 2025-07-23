import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/reset_password_model.dart';

class ResetPasswordController extends GetxController {
  final LoginServices _authService = LoginServices();

  ResetPasswordModel? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> resetPassword(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    response = null;
    update();
    final result = await _authService.resetPassword(email, password);
    if (result != null) {
      response = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
