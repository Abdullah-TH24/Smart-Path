import 'package:get/route_manager.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';

bool hasNavigated = false;

Future navigateToNextPage() async {
  if (hasNavigated) return;
  hasNavigated = true;
  await Future.delayed(const Duration(seconds: 3));
  Get.offAllNamed(AppRoutes.introductionPagesRoute);
}
