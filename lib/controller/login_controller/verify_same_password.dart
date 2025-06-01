import 'package:get/get_utils/src/extensions/internacionalization.dart';

verfiySamePassword(String? password, String? passwordConfirm) {
  if (password != passwordConfirm) {
    return 'password_valid'.tr;
  }
  return '';
}
