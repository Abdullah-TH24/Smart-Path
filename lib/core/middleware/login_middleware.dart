import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/teacher_view/teacher_routes.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getString('token') != null) {
      if (prefs!.getString('role') == 'student') {
        return const RouteSettings(name: AppRoutes.studentMainPageRoute);
      } else if (prefs!.getString('role') == 'teacher') {
        return const RouteSettings(name: TeacherRoutes.students);
        // return const RouteSettings(name: AppRoutes.parentMainPageRoute);
        // TODO add parent main page to routes then uncomment the previous line
      }
    }
    return null;
  }
}
