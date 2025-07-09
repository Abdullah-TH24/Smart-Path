import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/home/weekly_schedule_model.dart';
import 'package:smartpath/models/student_model/student_info_model.dart';

class HomeServices {
  Future? getInfo(String token) async {
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
        final responseBody = json.decode(response.body);
        final Map<String, dynamic> responseMap = {
          "name": responseBody['user']['name'],
          "middleName": responseBody['user']['middleName'],
          "lastName": responseBody['user']['lastName'],
          "phoneNumber": responseBody['user']['phoneNumber'],
          "email": responseBody['user']['email'],
          "role": responseBody['user']['role'],
          "className": responseBody['roleData'][1]['className'],
          "schoolGraduatedFrom":
              responseBody['roleData'][0]['schoolGraduatedFrom'],
          "photo": responseBody['roleData'][0]['photo'],
          "Gpa": responseBody['roleData'][0]['Gpa'],
          "expelled": responseBody['roleData'][0]['expelled'],
          "justification": responseBody['roleData'][0]['justification'],
        };
        log('$responseMap');
        return StudentInfo.fromJson(responseMap);
      } else {
        log('response: $response');
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
}
