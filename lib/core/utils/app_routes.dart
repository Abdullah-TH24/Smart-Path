import 'package:get/get.dart';
import 'package:smartpath/core/middleware/introduction_middleware.dart';
import 'package:smartpath/core/middleware/login_middleware.dart';
import 'package:smartpath/view/auth_view/auth_view.dart';
import 'package:smartpath/view/introduction_view/introduction_pages.dart';
import 'package:smartpath/view/login_view/enter_verification_code.dart';
import 'package:smartpath/view/login_view/login.dart';
import 'package:smartpath/view/login_view/request_reset_password.dart';
import 'package:smartpath/view/login_view/reset_password.dart';
import 'package:smartpath/view/splash_view/splash_screen.dart';
import 'package:smartpath/view/student_view/events/comments_page.dart';
import 'package:smartpath/view/student_view/events/reactions_info_page.dart';
import 'package:smartpath/view/student_view/home/absences/absences.dart';
import 'package:smartpath/view/student_view/home/class/class_view.dart';
import 'package:smartpath/view/student_view/home/courses/courses.dart';
import 'package:smartpath/view/student_view/home/exams/exams.dart';
import 'package:smartpath/view/student_view/home/grades/filter_page.dart';
import 'package:smartpath/view/student_view/home/grades/grades.dart';
import 'package:smartpath/view/student_view/home/homeworks/homeworks.dart';
import 'package:smartpath/view/student_view/home/quiz/quiz.dart';
import 'package:smartpath/view/student_view/home/schedule/schedule.dart';
import 'package:smartpath/view/student_view/library/student_library_page.dart';
import 'package:smartpath/view/student_view/profile/about.dart';
import 'package:smartpath/view/student_view/profile/contact.dart';
import 'package:smartpath/view/student_view/profile/profile_info.dart';
import 'package:smartpath/view/student_view/profile/settings/confirm_pin_code.dart';
import 'package:smartpath/view/student_view/profile/settings/enter_pin_code.dart';
import 'package:smartpath/view/student_view/profile/settings/lock_app_page.dart';
import 'package:smartpath/view/student_view/profile/settings/settings_page.dart';
import 'package:smartpath/view/student_view/profile/settings/verify_pin_code.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';

class AppRoutes {
  AppRoutes._();

  /* Shared Pages */
  static const String splashScreenRoute = '/splash_screen';
  static const String authRoute = '/auth_view';
  static const String introductionPagesRoute = '/introduction_pages';
  static const String loginRoute = '/login';
  static const String requestResetPassword = '/request_reset_password';
  static const String enterVerificationCode = '/enter_verification_code';
  static const String resetPasswordRoute = '/reset_password';
  static const String languagesRoute = '/lang_option_page.dart';

  /* Student Pages */
  static const String studentMainPageRoute = '/student_main_page';
  static const String studentEventsComments = '/comments_page';
  static const String studentEventsReactionsInfo = '/reactions_info';
  static const String studentProfileInfo = '/profile_info';
  static const String studentProfileSettings = '/settings_page';
  static const String studentProfileEnterPIN = '/enter_pin';
  static const String studentProfileConfirmPIN = '/confirm_pin';
  static const String studentProfileLockApp = '/lock_app';
  static const String studentProfileVerfiyPin = '/verfiy_pin';
  static const String studentProfileAbout = '/about';
  static const String studentProfileContact = '/contact';
  static const String studentClass = '/class_view';
  static const String studentCalendar = '/calendar';
  static const String studentFilterPage = '/filter_page';
  static const String studentGrades = '/grades';
  static const String studentExams = '/exams';
  static const String studentCourses = '/courses';
  static const String studentQuiz = '/quiz';
  static const String studentAbsences = '/absences';
  static const String studentHomeworks = '/homeworks';
  static const String studentLibrary = '/library';

  /// All routes list (like TeacherRoutes.routes)
  static final List<GetPage> routes = [
    GetPage(name: authRoute, page: () => const AuthScreen()),
    GetPage(
      name: splashScreenRoute,
      page: () => const SplashScreen(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: introductionPagesRoute,
      page: () => IntroductionPages(),
      middlewares: [IntroductionMiddleware()],
    ),
    GetPage(
      name: loginRoute,
      page: () => Login(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(name: requestResetPassword, page: () => RequestResetPassword()),
    GetPage(name: enterVerificationCode, page: () => EnterVerificationCode()),
    GetPage(name: resetPasswordRoute, page: () => ResetPassword()),

    // Student pages
    GetPage(name: studentMainPageRoute, page: () => const StudentMainPage()),
    GetPage(name: studentEventsComments, page: () => const CommentsPage()),
    GetPage(name: studentEventsReactionsInfo, page: () => ReactionsInfoPage()),
    GetPage(name: studentProfileInfo, page: () => ProfileInfo()),
    GetPage(name: studentProfileSettings, page: () => const SettingsPage()),
    GetPage(name: studentProfileEnterPIN, page: () => EnterPinCode()),
    GetPage(name: studentProfileConfirmPIN, page: () => ConfirmPinCode()),
    GetPage(name: studentProfileLockApp, page: () => const LockAppPage()),
    GetPage(name: studentProfileVerfiyPin, page: () => VerifyPinCode()),
    GetPage(name: studentProfileAbout, page: () => const About()),
    GetPage(name: studentProfileContact, page: () => const Contact()),
    GetPage(name: studentClass, page: () => const ClassView()),
    GetPage(name: studentCalendar, page: () => Schedule()),
    GetPage(name: studentFilterPage, page: () => FilterPage()),
    GetPage(name: studentGrades, page: () => Grades()),
    GetPage(name: studentExams, page: () => Exams()),
    GetPage(name: studentCourses, page: () => const Courses()),
    GetPage(name: studentQuiz, page: () => const Quiz()),
    GetPage(name: studentAbsences, page: () => const Absences()),
    GetPage(name: studentHomeworks, page: () => Homeworks()),
    GetPage(name: studentLibrary, page: () => const StudentLibraryPage()),
  ];
}
