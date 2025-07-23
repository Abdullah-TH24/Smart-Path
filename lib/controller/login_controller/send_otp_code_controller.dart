import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';

class SendOtpCodeController extends GetxController {
  final LoginServices _authService = LoginServices();

  bool? response;
  bool isLoading = false;
  String? errorMessage;

  Future<void> otpCode(String email, String otp) async {
    isLoading = true;
    errorMessage = null;
    response = null;
    update();
    final result = await _authService.otpCode(email, otp);
    if (result != null) {
      response = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
