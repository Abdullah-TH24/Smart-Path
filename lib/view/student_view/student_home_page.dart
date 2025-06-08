// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';
import 'package:smartpath/view/student_view/my_custom_app_bar_delegate.dart';

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

          SliverList.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return Container(height: 50, child: Text('data$index'));
            },
          ),
        ],
      ),
    );
  }
}
