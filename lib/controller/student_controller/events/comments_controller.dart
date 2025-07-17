import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/comment_model.dart';

class CommentsController extends GetxController {
  final HomeServices _homeService = HomeServices();
  final int id;
  CommentsController({required this.id});

  @override
  void onInit() {
    getEventComments(prefs!.getString('token')!, id);
    super.onInit();
  }

  List<CommentModel>? comments;
  bool isLoading = false;
  String? errorMessage;

  Future<void> getEventComments(String token, int id) async {
    isLoading = true;
    errorMessage = null;
    comments = null;
    update();
    final result = await _homeService.getEventComments(token, id);
    if (result != null) {
      comments = result;
      log(result.length.toString());
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
