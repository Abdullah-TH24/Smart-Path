// ignore_for_file: must_be_immutable, use_build_context_synchronously
// TODO just remove the comments
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:smartpath/firebase_options.dart'
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/core/localization/arabic_english_local.dart';
import 'package:smartpath/core/middleware/introduction_middleware.dart';
import 'package:smartpath/core/middleware/login_middleware.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/themes.dart';
import 'package:smartpath/view/auth_view/auth_view.dart';
import 'package:smartpath/view/introduction_view/introduction_pages.dart';
import 'package:smartpath/view/login_view/enter_verification_code.dart';
import 'package:smartpath/view/login_view/login.dart';
import 'package:smartpath/view/login_view/request_reset_password.dart';
import 'package:smartpath/view/login_view/reset_password.dart';
import 'package:smartpath/view/splash_view/splash_screen.dart';
import 'package:smartpath/view/student_view/home/schedule/schedule.dart';
import 'package:smartpath/view/student_view/home/class/class_view.dart';
import 'package:smartpath/view/student_view/home/courses/courses.dart';
import 'package:smartpath/view/student_view/home/exams/exams.dart';
import 'package:smartpath/view/student_view/home/grades/filter_page.dart';
import 'package:smartpath/view/student_view/home/grades/grades.dart';
import 'package:smartpath/view/student_view/profile/about.dart';
import 'package:smartpath/view/student_view/profile/profile_info.dart';
import 'package:smartpath/view/student_view/profile/settings/confirm_pin_code.dart';
import 'package:smartpath/view/student_view/profile/settings/enter_pin_code.dart';
import 'package:smartpath/view/student_view/profile/settings/lock_app_page.dart';
import 'package:smartpath/view/student_view/profile/settings/settings_page.dart';
import 'package:smartpath/view/student_view/profile/settings/verify_pin_code.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // TODO just remove the comments and inside android/app/build.gradle from line 4
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // String? messaging = await FirebaseMessaging.instance.getToken();
  // print("token $messaging");
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
        GetPage(name: AppRoutes.authRoute, page: () => const AuthScreen()),
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
        GetPage(
          name: AppRoutes.studentProfileSettings,
          page: () => const SettingsPage(),
        ),
        GetPage(
          name: AppRoutes.studentProfileEnterPIN,
          page: () => EnterPinCode(),
        ),
        GetPage(
          name: AppRoutes.studentProfileConfirmPIN,
          page: () => ConfirmPinCode(),
        ),
        GetPage(
          name: AppRoutes.studentProfileLockApp,
          page: () => const LockAppPage(),
        ),
        GetPage(
          name: AppRoutes.studentProfileVerfiyPin,
          page: () => VerifyPinCode(),
        ),
        GetPage(name: AppRoutes.studentProfileAbout, page: () => const About()),
        GetPage(name: AppRoutes.studentClass, page: () => const ClassView()),
        GetPage(name: AppRoutes.studentCalendar, page: () => Schedule()),
        GetPage(name: AppRoutes.studentFilterPage, page: () => FilterPage()),
        GetPage(name: AppRoutes.studentGrades, page: () => Grades()),
        GetPage(name: AppRoutes.studentExams, page: () => const Exams()),
        GetPage(name: AppRoutes.studentCourses, page: () => const Courses()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Path',
      theme: Themes.light,
    );
  }
}
