import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/home/student_model.dart';
import 'package:smartpath/models/student_model/home/teacher_model.dart';

class ClassServices {
  Future<Map<String, List>?> getStudentTeachersAndMates(String token) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppLinks.classes),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List teachersData = json.decode(response.body)['teachers'];
        final List<TeacherModel> teachers = [];
        for (var i = 0; i < teachersData.length; i++) {
          teachers.add(TeacherModel.fromJson(teachersData[i]));
        }
        final List studentsData = json.decode(response.body)['students'];
        final List<StudentModel> students = [];
        for (var i = 0; i < studentsData.length; i++) {
          students.add(StudentModel.fromJson(studentsData[i]));
        }
        return {'teachers': teachers, 'students': students};
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
