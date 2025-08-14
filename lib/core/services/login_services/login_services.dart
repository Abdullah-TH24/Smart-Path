import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smartpath/core/localization/api_translate.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/login_model/reset_password_model.dart';
import 'package:smartpath/models/login_model/send_forget_password_model.dart';
import 'package:smartpath/models/login_model/user_model.dart';

class LoginServices {
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(AppLinks.login),
        body: {'email': email, 'password': password, 'deviceType': 'mobile'},
      );
      final data = json.decode(response.body);
      final translatedMessage = ApiMessageTranslator.translate(data['message']);
      if (response.statusCode == 200) {
        prefs!.setString('token', data['token']);
        prefs!.setString('role', data['data']['user']['role']);
        return UserModel.fromJson({
          'status': data['status'],
          'message': translatedMessage,
          'role': data['data']['user']['role'],
        });
      } else {
        return UserModel.fromJson({
          'status': data['status'],
          'message': translatedMessage,
          'role': '',
        });
      }
    } catch (e) {
      log('error $e');
      return null;
    }
  }

  Future<SendForgetPasswordModel?> sendEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse(AppLinks.sendForgetPasswordOtp),
        body: {'email': email},
      );
      final data = json.decode(response.body);
      final translatedMessage = ApiMessageTranslator.translate(data['message']);
      if (response.statusCode == 200) {
        log('${data['data']['verificationCode']}');
        return SendForgetPasswordModel.fromJson({
          'status': response.statusCode,
          'message': translatedMessage,
        });
      } else {
        return SendForgetPasswordModel.fromJson({
          'status': response.statusCode,
          'message': translatedMessage,
        });
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> otpCode(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse(AppLinks.confirmForgetPasswordOtp),
        body: {'otp': otp, 'email': email},
      );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return data['status'];
      } else {
        return data['status'];
      }
    } catch (e) {
      return null;
    }
  }

  Future<ResetPasswordModel?> resetPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(AppLinks.resetPassword),
        body: {'email': email, 'password': password},
      );
      final data = json.decode(response.body);
      final translatedMessage = ApiMessageTranslator.translate(data['message']);
      if (response.statusCode == 200) {
        return ResetPasswordModel.fromJson({
          'status': data['status'],
          'message': translatedMessage,
        });
      } else {
        return ResetPasswordModel.fromJson({
          'status': data['status'],
          'message': translatedMessage,
        });
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> logout() async {
    try {
      final http.Response response = await http.delete(
        Uri.parse(AppLinks.logout),
        headers: {'Authorization': 'Bearer ${prefs!.getString('token')}'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
