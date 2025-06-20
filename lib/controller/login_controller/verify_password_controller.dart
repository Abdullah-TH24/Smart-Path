import 'package:get/get_utils/src/extensions/internacionalization.dart';

dynamic verifyPassword(String? value, int length) {
  if (length == 0) {
    return 'password_valid_empty'.tr;
  } else if (!RegExp(r'^[a-zA-Z\d!@#\$&*~]{8,}$').hasMatch(value!)) {
    return 'password_valid_weak'.tr;
  }
  return null;
}
