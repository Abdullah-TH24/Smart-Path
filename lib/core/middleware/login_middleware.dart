import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/main.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getString('login_state') == 'true') {
      // TODO here will replace -true- keyword with user token
      return const RouteSettings(name: AppRoutes.homeStudentRoute);
    }
    return null;
  }
}
