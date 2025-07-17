import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/home/weekly_schedule_model.dart';

class ScheduleController extends GetxController {
  final HomeServices _homeService = HomeServices();

  @override
  onInit() {
    getStudentWeeklySchedule(prefs!.getString('token')!);
    super.onInit();
  }

  List<WeeklyScheduleModel>? schedule;
  bool isLoading = false;
  String? errorMessage;

  Future<void> getStudentWeeklySchedule(String token) async {
    isLoading = true;
    errorMessage = null;
    schedule = null;
    update();
    final result = await _homeService.getStudentWeeklySchedule(token);
    if (result != null) {
      schedule = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
