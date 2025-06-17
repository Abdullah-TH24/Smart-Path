import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/localization/api_translate.dart';
import 'package:smartpath/core/utils/general_utils/app_links.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/login_model/reset_password_model.dart';
import 'package:smartpath/models/login_model/send_forget_password_model.dart';
import 'package:smartpath/models/login_model/user_model.dart';

class AuthService {
  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(AppLinks.login),
      body: {'email': email, 'password': password, 'deviceType': 'mobile'},
    );
    final data = json.decode(response.body);
    final translatedMessage = ApiMessageTranslator.translate(data['message']);
    if (response.statusCode == 200) {
      prefs!.setString('token', data['token']);
      prefs!.setString('role', data['data']['user']['role']);
      return UserModel(
        status: data['status'],
        message: translatedMessage,
        role: data['data']['user']['role'],
      );
    } else {
      return UserModel(
        status: data['status'],
        message: translatedMessage,
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
    final translatedMessage = ApiMessageTranslator.translate(data['message']);
    if (response.statusCode == 200) {
      return SendForgetPasswordModel(
        status: data['status'],
        message: translatedMessage,
        verificationCode: data['data']['verificationCode'],
      );
    } else {
      return SendForgetPasswordModel(
        status: data['status'],
        message: translatedMessage,
        verificationCode: 0,
      );
    }
  }

  Future<bool?> otpCode(String email, String otp) async {
    final response = await http.post(
      Uri.parse(AppLinks.confirmForgetPasswordOtp),
      body: {'otp': otp, 'email': email},
    );
    final data = json.decode(response.body);
    log('${data['status']}');
    if (response.statusCode == 200) {
      return data['status'];
    } else {
      return data['status'];
    }
  }

  Future<ResetPasswordModel?> resetPassword(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(AppLinks.resetPassword),
      body: {'email': email, 'password': password},
    );
    final data = json.decode(response.body);
    log('$data');
    final translatedMessage = ApiMessageTranslator.translate(data['message']);
    log(translatedMessage);
    if (response.statusCode == 200) {
      return ResetPasswordModel(
        status: data['status'],
        message: translatedMessage,
      );
    } else {
      return ResetPasswordModel(
        status: data['status'],
        message: translatedMessage,
      );
    }
  }
}
