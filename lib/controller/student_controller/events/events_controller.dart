import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/events_model.dart';
import 'package:smartpath/models/student_model/reaction_data_model.dart';

class EventsController extends GetxController {
  final HomeServices _homeService = HomeServices();

  @override
  void onInit() {
    getAllPublishedEvents(prefs!.getString('token')!);
    super.onInit();
  }

  List<PageController> pages = [];
  List<EventsModel>? events;
  bool isLoading = false;
  String? errorMessage;

  addPages() {
    pages.clear();
    if (events != null) {
      for (var i = 0; i < events!.length; i++) {
        pages.add(PageController());
      }
    }
  }

  checkReaction() {
    reactions.clear();
    if (events != null) {
      for (var i = 0; i < events!.length; i++) {
        if (events![i].isReacted! && events![i].userReactionType != null) {
          reactions[events![i].id!] = ReactionData(
            text: events![i].userReactionType!,
            image:
                'assets/images/${events![i].userReactionType!.toLowerCase()}.png',
            color:
                events![i].userReactionType!.toLowerCase() == 'like'
                    ? Colors.blue[600]!
                    : events![i].userReactionType!.toLowerCase() == 'love'
                    ? Colors.red[600]!
                    : Colors.yellow[900]!,
          );
        }
      }
    }
  }

  Future<void> getAllPublishedEvents(String token) async {
    isLoading = true;
    errorMessage = null;
    events = null;
    update();
    final result = await _homeService.getAllPublishedEvents(token);
    if (result != null) {
      events = result;
      await addPages();
      await checkReaction();
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }

  Map<int, ReactionData> reactions = {};

  void setReact(
    int postId,
    String newReactionType,
    String? image,
    Color color,
  ) {
    final eventIndex = events?.indexWhere((e) => e.id == postId);
    if (eventIndex == null || eventIndex == -1) return;

    final event = events![eventIndex];

    // نفضي كل التفاعلات ونعيد بناءها
    final Map<String, int> types = {};

    final oldReaction = event.userReactionType?.toLowerCase();
    final newReactionLower = newReactionType.toLowerCase();

    // إذا كان نفس التفاعل -> نشيله
    if (oldReaction == newReactionLower) {
      event.userReactionType = null;
      event.isReacted = false;
      reactions.remove(postId);
    } else {
      event.userReactionType = newReactionLower;
      event.isReacted = true;
      reactions[postId] = ReactionData(
        text: newReactionLower,
        image: image,
        color: color,
      );
    }

    final originalTypes = event.reactions?.types ?? {};

    originalTypes.forEach((key, value) {
      types[key.toLowerCase()] = value;
    });

    if (oldReaction != null) {
      types[oldReaction] = (types[oldReaction] ?? 1) - 1;
      if (types[oldReaction]! <= 0) types.remove(oldReaction);
    }

    if (event.userReactionType != null) {
      types[newReactionLower] = (types[newReactionLower] ?? 0) + 1;
    }

    event.reactions!.types = types;
    event.reactions!.reactionNumber = types.values.fold(0, (a, b) => a! + b);

    update();
  }

  ReactionData getReaction(int postId) {
    return reactions[postId] ??
        ReactionData(text: 'like', image: null, color: Colors.black87);
  }
}
