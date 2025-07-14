import 'package:get/get.dart';
import 'package:smartpath/view/teacher_view/home_view.dart';

import 'package:smartpath/view/teacher_view/my_courses_view.dart';
import 'package:smartpath/view/teacher_view/my_students_view.dart';
import 'package:smartpath/view/teacher_view/profile_view.dart';
import 'package:smartpath/view/teacher_view/teacher_dashboard_view.dart';

class TeacherRoutes {
  static const String dashboard = '/teacher/dashboard';
  static const String students = '/teacher/students';
  static const String courses = '/teacher/courses';
  static const String profile = '/teacher/profile';
  static const String home = '/teacher/home';

  static final List<GetPage> routes = [
    GetPage(name: dashboard, page: () => const TeacherDashboardView()),
    GetPage(name: students, page: () => const MyStudentsView()),
    GetPage(name: courses, page: () => const MyCoursesView()),
    GetPage(name: profile, page: () => const ProfileView()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}
