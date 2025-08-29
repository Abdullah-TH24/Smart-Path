import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/nurse_view/utils/nurse_routes.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final token = prefs!.getString('token');
    final role = prefs!.getString('role')?.toLowerCase();

    if (token != null && role != null) {
      switch (role) {
        case 'student':
          return const RouteSettings(name: AppRoutes.studentMainPageRoute);
        // case 'teacher':
        case 'nurse':
          return const RouteSettings(name: NurseRoutes.mainHome);
        case 'library':
        case 'supervisor':
          return const RouteSettings(name: LibrarianRoutes.mainHome);
        default:
          return null;
      }
    }

    return null;
  }
}
