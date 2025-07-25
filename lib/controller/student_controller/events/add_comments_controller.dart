import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';

class AddCommentsController extends GetxController {
  final EventsServices _eventsServices = EventsServices();

  bool addCommentRes = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> addComment(
    String token,
    int id,
    String content,
    int? parentId,
  ) async {
    isLoading = true;
    errorMessage = null;
    update();
    final result = await _eventsServices.addComment(
      token,
      id,
      content,
      parentId,
    );
    if (result) {
      addCommentRes = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
