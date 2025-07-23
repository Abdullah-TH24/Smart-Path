import 'package:get/get.dart';
import 'package:smartpath/core/services/auth_services/auth_services.dart';

class DeletePinCodeController extends GetxController {
  final AuthServices _authServices = AuthServices();
  bool isLoading = false;
  bool? resDelete;
  String? errorMessage;

  Future deletePinCode(String token) async {
    isLoading = true;
    errorMessage = null;
    resDelete = null;
    update();
    final result = await _authServices.deletePinCode(token);
    if (result != null) {
      resDelete = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
