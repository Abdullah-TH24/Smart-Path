import 'package:get/get.dart';
import 'package:smartpath/core/services/auth_services/auth_services.dart';

class CreateOrUpdatePinCode extends GetxController {
  final AuthServices _authServices = AuthServices();
  bool isLoading = false;
  bool? resCreateOrUpdate;
  String? errorMessage;

  Future createOrUpdatePinCode(
    String token,
    String pinCode,
    String confirmedPinCode,
  ) async {
    isLoading = true;
    errorMessage = null;
    resCreateOrUpdate = null;
    update();
    final result = await _authServices.createOrUpdatePinCode(
      token,
      pinCode,
      confirmedPinCode,
    );
    if (result != null) {
      resCreateOrUpdate = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
