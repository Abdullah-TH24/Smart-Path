import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/student_utils/student_home_page_utils.dart';
import 'package:smartpath/widgets/student/home/events_in_home_page.dart';
import 'package:smartpath/widgets/student/home/my_custom_app_bar_delegate.dart';
import 'package:smartpath/widgets/student/home/student_grid_view_home.dart';
import 'package:smartpath/widgets/student/home/welcome_item.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // <AppBar>
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: MyCustomAppBarDelegate(
            expandedHeight: 180,
            collapsedHeight: 110,
          ),
        ),
        // Content
        StudentGridViewHome(gridItems: gridItems),
        // welcome image
        WelcomeItem(),
        // Events
        const EventsInHomePage(),
      ],
    );
  }
}
