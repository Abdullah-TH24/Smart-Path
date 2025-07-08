import 'package:get/get.dart';
import 'package:smartpath/core/services/login_services/login_services.dart';

class LogoutController extends GetxController {
  final AuthService _authService = AuthService();

  bool? response;
  bool isLoading = false;
  String? message;
  String? errorMessage;

  Future<void> logout() async {
    isLoading = true;
    message = null;
    errorMessage = null;
    response = null;
    update();
    final result = await _authService.logout();
    if (result != null) {
      response = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
