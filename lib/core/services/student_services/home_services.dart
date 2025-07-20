import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/all_reactions_model.dart';
import 'package:smartpath/models/student_model/comment_model.dart';
import 'package:smartpath/models/student_model/events_model.dart';
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

  Future<List<EventsModel>?> getAllPublishedEvents(String token) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppLinks.events),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body)['events'];
        final List<EventsModel> events = [];
        for (var i = 0; i < data.length; i++) {
          events.add(EventsModel.fromJson(data[i]));
        }
        return events;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<CommentModel>?> getEventComments(String token, int id) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('${AppLinks.comments}/$id'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body)['data'] ?? [];
        log(response.body);
        log(data.toString());
        if (data.isEmpty) {
          return [];
        }
        final List<CommentModel> comments = [];
        for (var i = 0; i < data.length; i++) {
          comments.add(CommentModel.fromJson(data[i]));
        }
        return comments;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> addComment(
    String token,
    int id,
    String content,
    int? parentId,
  ) async {
    try {
      log('$id $content $parentId');
      final http.Response response = await http.post(
        Uri.parse(AppLinks.addComments),
        body: {
          "event_id": id.toString(),
          "content": content,
          if (parentId != null) "parent_id": parentId.toString(),
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return true;
      } else {
        log('false');
        return false;
      }
    } catch (e) {
      log('error ${e.toString()}');
      return false;
    }
  }

  Future<bool> deleteComment(String token, int commentId) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse('${AppLinks.deleteComments}/$commentId'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> editComment(String token, int commentId, String content) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('${AppLinks.editComments}/$commentId'),
        body: {"content": content},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addReaction(
    String token,
    String reaction,
    int reactableId,
    String reactableType,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.addReaction),
        body: {
          "reaction": reaction,
          "reactable_id": reactableId.toString(),
          "reactable_type": reactableType,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      log(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<AllReactionsModel>?> getReactions(
    String token,
    int reactableId,
    String reactableType,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.getReactions),
        body: {
          "reactable_id": reactableId.toString(),
          "reactable_type": reactableType,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        log('gooooooooooooooooooooood');
        final List data = json.decode(response.body)['message'];
        final List<AllReactionsModel> allReactions = [];
        for (var i = 0; i < data.length; i++) {
          allReactions.add(AllReactionsModel.fromJson(data[i]));
        }
        return allReactions;
      } else {
        log('elseeeeeeeeeeeeeeee');
        return null;
      }
    } catch (e) {
      log('eeeeeeeeeeeeeeeeeeee $e');
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
