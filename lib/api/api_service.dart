// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    // dynamic token = await TokenManage().getToken();
    // print(token);

    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      // print(jsonDecode(response.body));
      throw Exception('Failed to load data : ${response.statusCode}');
    }
  }

  //   Future<dynamic> post(
  //       {required String url,
  //       @required dynamic body,
  //       required bool withToken}) async {
  //     Map<String, String>? headers = {};
  //     if (withToken == true) {
  //       print(token);
  //       headers.addAll({
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //         'Cookie': '${await SessionManage().getSessionId()}'
  //       });
  //     }
  //     print('****************************8$body');
  //     http.Response response =
  //         await http.post(Uri.parse(url), body: body, headers: headers);

  //     // dynamic data = jsonDecode(response.body);
  //     // print('Response Body: $data');
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print(jsonDecode(response.body));
  //       print(response.statusCode);
  //       //for saving session id for the user when login or signup
  //       if (response.headers['set-cookie'] != null &&
  //           await SessionManage().getSessionId() == null) {
  //         String rawCookies = response.headers['set-cookie']!;
  //         SessionManage().saveSessionId(rawCookies.split(';')[0]);
  //       }
  //       // if (response.headers['set-cookie'] == null &&
  //       //     response.headers['set-cookie'] != null) {
  //       //   String cookie = response.headers['set-cookie']!;
  //       //   String sessionId = cookie.split(';')[0];
  //       //   await SessionManage().saveSessionId(sessionId);
  //       // }
  //       return jsonDecode(response.body);
  //     } else {
  //       print(jsonDecode(response.body));
  //     }
  //   }

  //   Future<dynamic> delete({required String url}) async {
  //     http.Response response = await http.delete(Uri.parse(url), headers: {
  //       'Authorization': 'Bearer ${await TokenManage().getToken()}',
  //       'Cookie': '${await SessionManage().getSessionId()}'
  //     });
  //     if (response.statusCode == 200) {
  //       // print(jsonDecode(response.body));
  //       return jsonDecode(response.body);
  //     } else {
  //       print(jsonDecode(response.body));
  //       throw Exception('Failed to delete: ${response.statusCode}');
  //     }
  //   }
}
