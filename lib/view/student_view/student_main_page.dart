// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/view/student_view/student_data_page.dart';
import 'package:smartpath/view/student_view/student_home_page.dart';
import 'package:smartpath/view/student_view/student_portfolio_page.dart';
import 'package:smartpath/view/student_view/student_profile_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  int pageIndex = 0;
  var screens = [
    StudentHomePage(),
    StudentPortfolioPage(),
    StudentDataPage(),
    StudentProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.decelerate,

        selectedColorOpacity: .3,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(18),
          // side: BorderSide(color: Color(0xff818cf8), ),
        ),
        currentIndex: pageIndex,
        onTap: (p) => setState(() => pageIndex = p),
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Assets.iconHomeInactive,
              colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
            ),
            title: Text('Home'),
            activeIcon: SvgPicture.asset(Assets.iconHomeActive),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Assets.iconFolderInactive,
              colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
            ),
            title: Text('Portfolio'),
            activeIcon: SvgPicture.asset(Assets.iconFolder, width: 25),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Assets.iconInputInactive,
              colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
            ),
            title: Text('Data'),
            activeIcon: SvgPicture.asset(Assets.iconInputEnabled),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Assets.iconProfileInactive,
              colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
            ),
            title: Text('Profile'),
            activeIcon: SvgPicture.asset(Assets.iconProfileActive),
          ),
        ],
      ),

      body: screens[pageIndex],
    );
  }
}
