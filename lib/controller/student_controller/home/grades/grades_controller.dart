import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/models/student_model/home/grades_model.dart';

class GradesController extends GetxController {
  final HomeServices _homeService = HomeServices();

  List<GradesModel>? grades;
  bool isLoading = false;
  String? errorMessage;
  String? noResultsMessages;

  Future<void> getGrades(
    String token,
    int year,
    String semester,
    String type,
  ) async {
    isLoading = true;
    errorMessage = null;
    grades = null;
    noResultsMessages = null;
    update();
    final result = await _homeService.getGrades(token, year, semester, type);
    if (result != null) {
      if (result.isNotEmpty) {
        grades = result;
      } else {
        noResultsMessages = 'There is no results right now';
      }
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
