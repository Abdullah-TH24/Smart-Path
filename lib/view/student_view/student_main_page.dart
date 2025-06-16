import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/student_utils/student_main_page_utils.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.decelerate,
        selectedColorOpacity: .25,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(18),
        ),
        currentIndex: pageIndex,
        onTap: (page) => setState(() => pageIndex = page),
        items: List.generate(
          pages.length,
          // <Icon, title and activeIcon> * 4
          (index) => SalomonBottomBarItem(
            icon: items[index].icon,
            title: items[index].title,
            activeIcon: items[index].activeIcon,
          ),
        ),
      ),
    );
  }
}
