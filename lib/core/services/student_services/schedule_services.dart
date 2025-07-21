import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/home/weekly_schedule_model.dart';

class ScheduleServices {
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
