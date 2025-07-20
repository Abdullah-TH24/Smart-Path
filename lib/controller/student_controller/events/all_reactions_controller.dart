import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/all_reactions_model.dart';
import 'package:smartpath/models/student_model/user_model.dart';

class AllReactionsController extends GetxController {
  final HomeServices _homeService = HomeServices();
  List<User> users = [];
  List reactionImages = [];
  int tabIndex = 0;
  int reactableId;
  String reactableType;
  AllReactionsController({
    required this.reactableId,
    required this.reactableType,
  });

  @override
  void onInit() {
    getReactions(prefs!.getString('token')!, reactableId, reactableType);
    super.onInit();
  }

  List<AllReactionsModel>? allReactions;
  bool isLoading = false;
  String? errorMessage;

  get events => null;

  Future<void> getReactions(
    String token,
    int reactableId,
    String reactableType,
  ) async {
    isLoading = true;
    errorMessage = null;
    allReactions = null;
    update();
    final result = await _homeService.getReactions(
      token,
      reactableId,
      reactableType,
    );
    if (result != null) {
      allReactions = result;
      for (var i = 0; i < allReactions!.length; i++) {
        for (var j = 0; j < allReactions![i].user!.length; j++) {
          users.add(allReactions![i].user![j]);
          reactionImages.add(allReactions![i].reactionType);
        }
      }
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }

  changeTabIndex(int value) async {
    users.clear();
    reactionImages.clear();
    if (value > 0) {
      for (var i = 0; i < allReactions![value - 1].user!.length; i++) {
        users.add(allReactions![value - 1].user![i]);
        reactionImages.add(allReactions![value - 1].reactionType);
      }
    } else {
      for (var i = 0; i < allReactions!.length; i++) {
        for (var j = 0; j < allReactions![i].user!.length; j++) {
          users.add(allReactions![i].user![j]);
          reactionImages.add(allReactions![i].reactionType);
        }
      }
    }
    tabIndex = value;
    update();
  }
}
