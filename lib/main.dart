// ignore_for_file: must_be_immutable, use_build_context_synchronously
// TODO just remove the comments
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/localization/arabic_english_local.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/themes.dart';
import 'package:smartpath/view/auth_view/auth_view.dart';
import 'package:smartpath/view/introduction_view/introduction_pages_view.dart';
import 'package:smartpath/view/login_view/enter_verification_code_view.dart';
import 'package:smartpath/view/login_view/login_view.dart';
import 'package:smartpath/view/login_view/request_reset_password_view.dart';
import 'package:smartpath/view/login_view/reset_password_view.dart';
import 'package:smartpath/view/splash_view/splash_view.dart';
import 'package:smartpath/view/student_view/events_view/comments_view.dart';
import 'package:smartpath/view/student_view/events_view/reactions_info_view.dart';
import 'package:smartpath/view/student_view/home_view/attendance_view/attendance_view.dart';
import 'package:smartpath/view/student_view/home_view/homeworks_view/homeworks_view.dart';
import 'package:smartpath/view/student_view/home_view/quiz_view/quiz_view.dart';
import 'package:smartpath/view/student_view/home_view/schedule_view/schedule_view.dart';
import 'package:smartpath/view/student_view/home_view/class_view/class_view.dart';
import 'package:smartpath/view/student_view/home_view/courses_view/courses_view.dart';
import 'package:smartpath/view/student_view/home_view/exams_view/exams_view.dart';
import 'package:smartpath/view/student_view/home_view/grades_view/filter_view.dart';
import 'package:smartpath/view/student_view/home_view/grades_view/grades_view.dart';
import 'package:smartpath/view/student_view/library/student_library_page.dart';
import 'package:smartpath/view/student_view/profile_view/about_view.dart';
import 'package:smartpath/view/student_view/profile_view/contact_view.dart';
import 'package:smartpath/view/student_view/profile_view/profile_info_view.dart';
import 'package:smartpath/view/student_view/profile_view/settings_view/confirm_pin_code_view.dart';
import 'package:smartpath/view/student_view/profile_view/settings_view/enter_pin_code_view.dart';
import 'package:smartpath/view/student_view/profile_view/settings_view/lock_app_view.dart';
import 'package:smartpath/view/student_view/profile_view/settings_view/settings_view.dart';
import 'package:smartpath/view/student_view/profile_view/settings_view/verify_pin_code_view.dart';
import 'package:smartpath/view/student_view/student_main_view.dart';
import 'package:smartpath/firebase_options.dart';
import 'package:smartpath/view/nurse_view/utils/nurse_routes.dart';
import 'package:smartpath/view/teacher_view/teacher_routes.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // TODO just remove the comments and inside android/app/build.gradle from line 4
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? messaging = await FirebaseMessaging.instance.getToken();
  print("token $messaging");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  LocalizationController locale = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splashScreenRoute,
      locale: locale.initailLang,
      translations: ArabicEnglishLocal(),
      defaultTransition: Transition.cupertinoDialog,
      transitionDuration: const Duration(seconds: 1),
      getPages: [
        ...AppRoutes.routes,
        ...TeacherRoutes.routes,
        ...LibrarianRoutes.routes,
        ...NurseRoutes.routes,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Path',
      theme: Themes.light,
    );
  }
}
