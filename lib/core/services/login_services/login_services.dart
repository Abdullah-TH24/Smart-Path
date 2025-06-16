import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/general_utils/app_links.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/login_model/send_forget_password_model.dart';
import 'package:smartpath/models/login_model/user_model.dart';

class AuthService {
  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(AppLinks.login),
      body: {'email': email, 'password': password, 'deviceType': 'mobile'},
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      prefs!.setString('token', data['token']);
      log(response.body);
      return UserModel(
        status: data['status'],
        message: data['message'],
        role: data['data']['user']['role'],
      );
    } else {
      return UserModel(
        status: data['status'],
        message: data['message'],
        role: '',
      );
    }
  }

  Future<SendForgetPasswordModel?> sendEmail(String email) async {
    final response = await http.post(
      Uri.parse(AppLinks.sendForgetPasswordOtp),
      body: {'email': email},
    );
    final data = json.decode(response.body);
    log(response.body);
    if (response.statusCode == 200) {
      return SendForgetPasswordModel(
        status: data['status'],
        message: data['message'],
        verificationCode: data['data']['verificationCode'],
      );
    } else {
      return SendForgetPasswordModel(
        status: data['status'],
        message: data['message'],
        verificationCode: 0,
      );
    }
  }
}
