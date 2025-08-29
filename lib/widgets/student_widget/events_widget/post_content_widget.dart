import 'package:flutter/material.dart';
import 'package:smartpath/controller/student_controller/events_controller/events_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class PostContent extends StatelessWidget {
  final EventsController controller;
  final int index;
  const PostContent({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Text(
        '${controller.events![index].post}',
        style: AppStyles.styleRegular14(),
      ),
    );
  }
}
