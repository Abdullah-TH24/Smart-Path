import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/class_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/home_model/student_model.dart';
import 'package:smartpath/models/student_model/home_model/teacher_model.dart';

class ClassController extends GetxController {
  final ClassServices _classServices = ClassServices();

  List<TeacherModel>? teachers;
  List<StudentModel>? students;
  Map? classes;
  bool isLoading = false;
  String? errorMessage;

  @override
  onInit() {
    getStudentTeachersAndMates(prefs!.getString('token')!);
    super.onInit();
  }

  Future getStudentTeachersAndMates(String token) async {
    isLoading = true;
    errorMessage = null;
    classes = null;
    update();
    final result = await _classServices.getStudentTeachersAndMates(token);
    if (result != null) {
      classes = result;
      teachers = classes!['teachers'];
      students = classes!['students'];
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
