// ignore_for_file: avoid_print, prefer_final_locals

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smartpath/main.dart';

class Api {
  Future<dynamic> get({required String url, bool? withToken}) async {
    dynamic token = prefs!.getString('token');
    // print(token);
    if (withToken == true) {
      // print(token);
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
        throw Exception('Failed to load data : ${response.statusCode}');
      }
    }
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body));
      throw Exception('Failed to load data : ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    required bool withToken,
  }) async {
    Map<String, String>? headers = {};
    dynamic token = prefs!.getString('token');
    if (withToken == true) {
      print(token);
      headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );
    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
      print(response.statusCode);
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body));
    }
  }

  Future<dynamic> delete({required String url}) async {
    dynamic token = prefs!.getString('token');
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete: ${response.statusCode}');
    }
  }
}
