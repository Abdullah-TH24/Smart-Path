import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';

class ReportCommentController extends GetxController {
  final EventsServices _eventsServices = EventsServices();
  bool isLoading = false;
  String? errorMessage;
  String? result;

  Future<void> reportComment(
    String token,
    String commentId,
    String reason,
  ) async {
    isLoading = true;
    errorMessage = null;
    result = null;
    result = await _eventsServices.reportComment(token, commentId, reason);
    if (result == null) {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
  }
}
