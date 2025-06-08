// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/localization/arabic_english_local.dart';
import 'package:smartpath/core/middleware/introduction_middleware.dart';
import 'package:smartpath/core/middleware/login_middleware.dart';
import 'package:smartpath/utils/general_utils/app_routes.dart';
import 'package:smartpath/utils/general_utils/themes.dart';
import 'package:smartpath/view/introduction_view/introduction_pages.dart';
import 'package:smartpath/view/login_view/login.dart';
import 'package:smartpath/view/login_view/reset_password.dart';
import 'package:smartpath/view/splash_view/splash_screen.dart';
import 'package:smartpath/view/login_view/lang_option_page.dart';
import 'package:smartpath/view/student_view/student_home_page.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  LocalizationController locale = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'splash_screen',
      locale: locale.initailLang,
      translations: ArabicEnglishLocal(),
      defaultTransition: Transition.cupertinoDialog,
      transitionDuration: const Duration(seconds: 1),
      getPages: [
        GetPage(
          name: AppRoutes.splashScreenRoute,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: AppRoutes.introductionPagesRoute,
          page: () => IntroductionPages(),
          middlewares: [IntroductionMiddleware()],
        ),
        GetPage(
          name: AppRoutes.loginRoute,
          page: () => Login(),
          middlewares: [LoginMiddleware()],
        ),
        GetPage(
          name: AppRoutes.resetPasswordRoute,
          page: () => ResetPassword(),
        ),
        GetPage(name: AppRoutes.languagesRoute, page: () => LangOptionPage()),
        GetPage(
          name: AppRoutes.studentHomePageRoute,
          page: () => StudentHomePage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Path',
      theme: Themes().light,
    );
  }
}
