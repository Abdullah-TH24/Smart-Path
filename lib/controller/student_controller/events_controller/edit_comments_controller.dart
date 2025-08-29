import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';

class EditCommentsController extends GetxController {
  final EventsServices _eventsServices = EventsServices();
  bool editCommentRes = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> editComment(String token, int commentId, String content) async {
    isLoading = true;
    errorMessage = null;
    update();
    final result = await _eventsServices.editComment(token, commentId, content);
    if (result) {
      editCommentRes = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
