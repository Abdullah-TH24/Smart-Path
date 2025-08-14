import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/localization/api_translate.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/student_model/all_reactions_model.dart';
import 'package:smartpath/models/student_model/comment_model.dart';
import 'package:smartpath/models/student_model/events_model.dart';

class EventsServices {
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
        final List data = json.decode(response.body)['message'];
        final List<AllReactionsModel> allReactions = [];
        for (var i = 0; i < data.length; i++) {
          allReactions.add(AllReactionsModel.fromJson(data[i]));
        }
        return allReactions;
      } else {
        return [];
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> reportComment(
    String token,
    String commentId,
    String reason,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.reportComment),
        body: {"comment_id": commentId.toString(), "reason": reason},
        headers: {'Authorization': 'Bearer $token'},
      );
      final translatedMessage = ApiMessageTranslator.translate(
        json.decode(response.body)['message'],
      );
      if (response.statusCode == 200) {
        return translatedMessage;
      } else {
        return translatedMessage;
      }
    } catch (e) {
      return null;
    }
  }
}
