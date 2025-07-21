import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';

class AddReactionController extends GetxController {
  final EventsServices _eventsServices = EventsServices();

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
    final result = await _eventsServices.addReaction(
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
