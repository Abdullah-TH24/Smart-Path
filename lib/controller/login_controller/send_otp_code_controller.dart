import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';

class SendOtpCodeController extends GetxController {
  final AuthService _authService = AuthService();

  bool? otpResponse;
  bool isLoading = false;
  String? errorMessage;

  Future<void> otpCode(String email, String otp) async {
    isLoading = true;
    errorMessage = null;
    update();
    try {
      final result = await _authService.otpCode(email, otp);
      if (result != null) {
        otpResponse = result;
      }
    } catch (e) {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
