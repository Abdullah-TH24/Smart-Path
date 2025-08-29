import 'dart:io';

import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/attendance_services.dart';

class UploadJustificationController extends GetxController {
  final AttendanceServices _attendanceServices = AttendanceServices();

  bool? isLoading;
  String? errorMessage;
  bool? result;

  Future uploadJustification(String token, File pdfFile) async {
    isLoading = true;
    result = null;
    update();
    result = await _attendanceServices.uploadJustification(token, pdfFile);
    if (result == null) {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
