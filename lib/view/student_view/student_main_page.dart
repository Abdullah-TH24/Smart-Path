import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartpath/models/student_model/bottom_bar_item_model.dart';
import 'package:smartpath/view/student_view/data/student_data_page.dart';
import 'package:smartpath/view/student_view/home/student_home_page.dart';
import 'package:smartpath/view/student_view/portfolio/student_portfolio_page.dart';
import 'package:smartpath/view/student_view/profile/student_profile_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

int pageIndex = 0;

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  Widget build(BuildContext context) {
    // Initial page at <home>
    final pages = <StatelessWidget>[
      const StudentHomePage(),
      const StudentPortfolioPage(),
      const StudentDataPage(),
      StudentProfilePage(),
    ];
    // Items of bottom bar
    final items = <BottomBarItemModel>[
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconHomeInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('home'.tr),
        activeIcon: SvgPicture.asset(AppAssets.iconHomeActive),
      ),
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconFolderInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('portfolio'.tr),
        activeIcon: SvgPicture.asset(AppAssets.iconFolder, width: 25),
      ),
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconInputInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('input'.tr),
        activeIcon: SvgPicture.asset(AppAssets.iconInputEnabled),
      ),
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconProfileInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('profile'.tr),
        activeIcon: SvgPicture.asset(AppAssets.iconProfileActive),
      ),
    ];
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
