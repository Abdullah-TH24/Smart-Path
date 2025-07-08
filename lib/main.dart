// ignore_for_file: must_be_immutable
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/localization/arabic_english_local.dart';
import 'package:smartpath/core/middleware/introduction_middleware.dart';
import 'package:smartpath/core/middleware/login_middleware.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/themes.dart';
// import 'package:smartpath/firebase_options.dart';
import 'package:smartpath/view/introduction_view/introduction_pages.dart';
import 'package:smartpath/view/login_view/enter_verification_code.dart';
import 'package:smartpath/view/login_view/login.dart';
import 'package:smartpath/view/login_view/request_reset_password.dart';
import 'package:smartpath/view/login_view/reset_password.dart';
import 'package:smartpath/view/splash_view/splash_screen.dart';
import 'package:smartpath/view/student_view/home/calendar/calendar.dart';
import 'package:smartpath/view/student_view/home/courses/courses.dart';
import 'package:smartpath/view/student_view/home/exams/exams.dart';
import 'package:smartpath/view/student_view/home/grades/filter_page.dart';
import 'package:smartpath/view/student_view/home/grades/grades.dart';
import 'package:smartpath/view/student_view/profile/profile_info.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String? messaging = await FirebaseMessaging.instance.getToken();
  print("token $messaging");
  prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          name: AppRoutes.requestResetPassword,
          page: () => RequestResetPassword(),
        ),
        GetPage(
          name: AppRoutes.enterVerificationCode,
          page: () => EnterVerificationCode(),
        ),
        GetPage(
          name: AppRoutes.resetPasswordRoute,
          page: () => ResetPassword(),
        ),
        GetPage(
          name: AppRoutes.studentMainPageRoute,
          page: () => const StudentMainPage(),
        ),
        GetPage(name: AppRoutes.studentProfileInfo, page: () => ProfileInfo()),
        GetPage(name: AppRoutes.studentCalendar, page: () => Calendar()),
        GetPage(name: AppRoutes.studentFilterPage, page: () => FilterPage()),
        GetPage(name: AppRoutes.studentGrades, page: () => const Grades()),
        GetPage(name: AppRoutes.studentExams, page: () => const Exams()),
        GetPage(name: AppRoutes.studentCourses, page: () => const Courses()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Path',
      theme: Themes.light,
    );
  }
}
