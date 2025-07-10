// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';
import 'package:smartpath/widgets/student/home/grades/content_filter_page_widget.dart';

class FilterPage extends StatelessWidget {
  FilterPage({super.key});

  GlobalKey<FormState> filter = GlobalKey<FormState>();
  TextEditingController year = TextEditingController();
  TextEditingController type = TextEditingController();
  final Map values = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          CalendarAppBarComponent(data: 'filter_page_title'.tr),
          // Content Page
          ContentFilterPage(
            years: values['years'],
            filter: filter,
            studentName: values['name'],
            year: year,
            type: type,
          ),
        ],
      ),
    );
  }
}
