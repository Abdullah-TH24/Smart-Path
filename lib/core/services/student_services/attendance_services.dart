import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';

class AttendanceServices {
  Future<List?> getStudentAbsenceDates(String token) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(AppLinks.attendance),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body)['absentDates'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> uploadJustification(String token, File pdfFile) async {
    try {
      final http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(AppLinks.uploadJustification),
      );
      request.files.add(await http.MultipartFile.fromPath('justification', pdfFile.path));
      request.headers.addAll({'Authorization': 'Bearer $token'});
      final http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        log('true');
        return true;
      } else {
        log('false ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('catch-> $e');
      return null;
    }
  }
}
