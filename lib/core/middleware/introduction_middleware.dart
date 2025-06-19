import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';

class IntroductionMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getBool('introduction_state') == true) {
      return const RouteSettings(name: AppRoutes.loginRoute);
    }
    return null;
  }
}
