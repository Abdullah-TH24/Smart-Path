import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/attendance_services.dart';
import 'package:smartpath/main.dart';

class AttendanceController extends GetxController {
  final AttendanceServices _attendanceServices = AttendanceServices();

  bool? isLoading;
  List? absentDates;
  String? errorMessage;

  @override
  void onInit() {
    getStudentAbsenceDates(prefs!.getString('token')!);
    super.onInit();
  }

  Future getStudentAbsenceDates(String token) async {
    isLoading = true;
    update();
    absentDates = await _attendanceServices.getStudentAbsenceDates(token);
    if (absentDates == null) {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
