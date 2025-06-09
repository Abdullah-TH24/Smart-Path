import 'package:flutter/material.dart';
import 'package:smartpath/widgets/home/my_custom_app_bar_delegate.dart';
import 'package:smartpath/view/student_view/student_grid_view_home.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: MyCustomAppBarDelegate(
              expandedHeight: 180,
              collapsedHeight: 80,
            ),
          ),

          const StudentGridViewHome(),
        ],
      ),
    );
  }
}
