import 'package:get/route_manager.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';

bool hasNavigated = false;

Future navigateToNextPage() async {
  if (hasNavigated) return;
  hasNavigated = true;
  await Future.delayed(const Duration(seconds: 3));
  if (prefs!.getString('role') != null &&
      prefs!.getString('role') == 'student') {
    if (prefs!.getBool('lock_screen') ?? false) {
      Get.offAllNamed(AppRoutes.authRoute);
    } else {
      Get.offAllNamed(AppRoutes.introductionPagesRoute);
    }
  } else {
    Get.offAllNamed(AppRoutes.introductionPagesRoute);
  }
}
