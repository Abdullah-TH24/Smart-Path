import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/events_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/all_reactions_model.dart';

class AllReactionsController extends GetxController {
  final EventsServices _eventsServices = EventsServices();
  int reactableId;
  String reactableType;
  AllReactionsController({
    required this.reactableId,
    required this.reactableType,
  });

  bool isLoading = false;
  List<AllReactionsModel>? allReactions;
  String? errorMessage;
  int tabIndex = 0;
  List<AllReactionsModel>? nowReactions;
  Set<String> reactionTypes = {};

  @override
  void onInit() {
    getReactions(prefs!.getString('token')!, reactableId, reactableType);
    super.onInit();
  }

  Future? getReactions(
    String token,
    int reactableId,
    String reactableType,
  ) async {
    isLoading = true;
    errorMessage = null;
    update();
    allReactions = await _eventsServices.getReactions(
      token,
      reactableId,
      reactableType,
    );
    if (allReactions == null) {
      errorMessage = 'error_message'.tr;
    } else {
      nowReactions = allReactions;
      for (var i = 0; i < nowReactions!.length; i++) {
        reactionTypes.add(nowReactions![i].reactionType!.toLowerCase());
      }
    }
    isLoading = false;
    update();
  }

  changeTabIndex(int value, String reactionType) async {
    isLoading = true;
    update();
    nowReactions = [];
    for (var i = 0; i < allReactions!.length; i++) {
      if (reactionType == 'all') {
        nowReactions!.add(allReactions![i]);
      }
      if (allReactions![i].reactionType!.toLowerCase() ==
          reactionType) {
        nowReactions?.add(allReactions![i]);
      }
    }
    tabIndex = value;
    isLoading = false;
    update();
  }
}
