import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';

class EditCommentsController extends GetxController {
  final HomeServices _homeService = HomeServices();

  bool editCommentRes = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> editComment(String token, int commentId, String content) async {
    isLoading = true;
    errorMessage = null;
    update();
    final result = await _homeService.editComment(token, commentId, content);
    if (result) {
      editCommentRes = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
