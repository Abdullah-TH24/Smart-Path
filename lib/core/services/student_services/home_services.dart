import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/home/grades_model.dart';
import 'package:smartpath/models/student_model/home/weekly_schedule_model.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';

class HomeServices {
  Future<StudentModel?> getInfo(String token) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppLinks.homepage),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return StudentModel.fromJson(json.decode(response.body)['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<WeeklyScheduleModel>?> getStudentWeeklySchedule(
    String token,
  ) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppLinks.weeklySchedule),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List schedule = json.decode(response.body)['schedule'];
        final List<WeeklyScheduleModel> sessions = [];
        for (var i = 0; i < schedule.length; i++) {
          final WeeklyScheduleModel session = WeeklyScheduleModel.fromMap(
            schedule[i],
          );
          sessions.add(session);
        }
        return sessions;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<GradesModel>?> getGrades(
    String token,
    int year,
    String semester,
    String type,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.grades),
        body: json.encode({"semester": semester, "type": type, "year": year}),
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
