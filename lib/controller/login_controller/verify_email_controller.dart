import 'package:get/get_utils/src/extensions/internacionalization.dart';

dynamic verifyEmail(String? value, int length) {
  if (length == 0) {
    return 'email-valid_empty'.tr;
  } else if (!RegExp(
    r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(value!)) {
    return 'email-valid_weak'.tr;
  }
  return null;
}
