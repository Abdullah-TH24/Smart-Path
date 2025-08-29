import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';

class DeleteCommentsController extends GetxController {
  final EventsServices _eventsServices = EventsServices();
  bool deleteCommentRes = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> deleteComment(String token, int commentId) async {
    isLoading = true;
    errorMessage = null;
    update();
    final result = await _eventsServices.deleteComment(token, commentId);
    if (result) {
      deleteCommentRes = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
