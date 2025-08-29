import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';
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
        log('TRUE ${response.body}');
        return StudentModel.fromJson(json.decode(response.body)['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
