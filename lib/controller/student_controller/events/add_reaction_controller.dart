import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';

class AddReactionController extends GetxController {
  final HomeServices _homeService = HomeServices();

  bool addReactRes = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> addReaction(
    String token,
    String reaction,
    int reactableId,
    String reactableType,
  ) async {
    isLoading = true;
    errorMessage = null;
    update();
    final result = await _homeService.addReaction(
      token,
      reaction,
      reactableId,
      reactableType,
    );
    if (result) {
      addReactRes = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
