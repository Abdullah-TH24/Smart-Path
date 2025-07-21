import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/comment_model.dart';

class CommentsController extends GetxController {
  final HomeServices _homeService = HomeServices();
  final int id;
  CommentsController({required this.id});
  List<bool> isExpanded = [];

  @override
  void onInit() {
    getEventComments(prefs!.getString('token')!, id);
    super.onInit();
  }

  List<CommentModel>? comments;
  bool isLoading = false;
  String? errorMessage;

  initArrayIsExapanded(int length) {
    isExpanded = List.generate(length, (index) => false);
  }

  Future<void> getEventComments(String token, int id) async {
    isLoading = true;
    errorMessage = null;
    comments = null;
    update();
    final result = await _homeService.getEventComments(token, id);
    if (result != null) {
      await initArrayIsExapanded(result.length);
      comments = result;
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }

  changeValueToExpanded(int index, bool value) {
    isExpanded[index] = value;
    update();
  }
}
