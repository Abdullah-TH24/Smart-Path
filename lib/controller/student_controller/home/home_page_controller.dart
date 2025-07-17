import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';

class HomePageController extends GetxController {
  final HomeServices _homeService = HomeServices();

  @override
  void onInit() {
    getInfo(prefs!.getString('token')!);
    super.onInit();
  }

  StudentModel? studentInfo;
  bool isLoading = false;
  String? errorMessage;

  Future<void> getInfo(String token) async {
    isLoading = true;
    errorMessage = null;
    studentInfo = null;
    update();
    final result = await _homeService.getInfo(token);
    if (result != null) {
      studentInfo = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
