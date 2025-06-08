import 'package:get/route_manager.dart';
import 'package:smartpath/utils/general_utils/app_routes.dart';

Future navigateToNextPage() async {
  await Future.delayed(const Duration(seconds: 3));
  Get.offAllNamed(AppRoutes.introductionPagesRoute);
}
