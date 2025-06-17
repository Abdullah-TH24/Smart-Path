import 'package:get/get_utils/src/extensions/internacionalization.dart';

dynamic verfiySamePassword(String? password, String? passwordConfirm) {
  if (passwordConfirm!.isEmpty) {
    return 'password_valid_empty'.tr;
  }
  if (password != passwordConfirm) {
    return 'password_valid'.tr;
  }
  return null;
}
