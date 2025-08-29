// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';
import 'package:smartpath/widgets/student_widget/home_widget/grades_widget/content_filter_page_widget.dart';

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
          AppBarComponent(data: 'filter_page_title'.tr),
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
