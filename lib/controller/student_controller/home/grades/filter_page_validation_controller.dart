import 'package:get/get_utils/src/extensions/internacionalization.dart';

String? validationField(value) {
  if (value == null || value.isEmpty) {
    return 'field_validation_text'.tr;
  }
  return null;
}
