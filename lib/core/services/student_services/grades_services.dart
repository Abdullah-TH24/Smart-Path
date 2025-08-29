import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/home_model/grades_model.dart';

class GradesServices {
  Future<List<GradesModel>?> getGrades(
    String token,
    int year,
    String semester,
    String type,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.grades),
        body: json.encode({'semester': semester, 'type': type, 'year': year}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final List<GradesModel> grades = [];
        final List data = json.decode(response.body)['imported_count'];
        for (var i = 0; i < data.length; i++) {
          grades.add(GradesModel.fromJson(data[i]));
        }
        return grades;
      } else {
        return [];
      }
    } catch (e) {
      return null;
    }
  }
}
