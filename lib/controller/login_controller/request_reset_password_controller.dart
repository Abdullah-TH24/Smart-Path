import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';
import 'package:smartpath/models/login_model/send_forget_password_model.dart';

class RequestResetPasswordController extends GetxController {
  final LoginServices _authService = LoginServices();

  SendForgetPasswordModel? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> sendEmail(String email) async {
    isLoading = true;
    errorMessage = null;
    response = null;
    update();
    final result = await _authService.sendEmail(email);
    if (result != null) {
      response = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
