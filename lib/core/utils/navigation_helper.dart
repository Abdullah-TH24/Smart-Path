import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/nurse_view/utils/nurse_routes.dart';
import 'package:smartpath/main.dart';

/// Navigate the user to the correct home page based on their role
void navigateAfterLogin() {
  final role = prefs!.getString('role') ?? '';

  switch (role.toLowerCase()) {
    case 'student':
      Get.offAllNamed(AppRoutes.studentMainPageRoute);
      break;
    // case 'teacher':
    case 'nurse':
      Get.offAllNamed(NurseRoutes.mainHome);
      break;
    case 'library':
      Get.offAllNamed(LibrarianRoutes.mainHome);
      break;
    default:
      Get.offAllNamed(AppRoutes.loginRoute);
  }
}
