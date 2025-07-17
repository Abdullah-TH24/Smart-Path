import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/services/student_services/home_services.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/events_model.dart';

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

  Future<void> getAllPublishedEvents(String token) async {
    isLoading = true;
    errorMessage = null;
    events = null;
    update();
    final result = await _homeService.getAllPublishedEvents(token);
    if (result != null) {
      events = result;
      await addPages();
    } else {
      errorMessage = 'error_message'.tr;
    }
    isLoading = false;
    update();
  }
}
