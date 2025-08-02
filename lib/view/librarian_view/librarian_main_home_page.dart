import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartpath/models/student_model/bottom_bar_item_model.dart';
import 'package:smartpath/view/librarian_view/librarian_add_book_page.dart';
import 'package:smartpath/view/librarian_view/librarian_complaint_page.dart';
import 'package:smartpath/view/librarian_view/librarian_home_page.dart';

class LibrarianMainHomePage extends StatefulWidget {
  const LibrarianMainHomePage({super.key});

  @override
  State<LibrarianMainHomePage> createState() => _LibrarianMainHomePageState();
}

int pageIndex = 1;

class _LibrarianMainHomePageState extends State<LibrarianMainHomePage> {
  @override
  Widget build(BuildContext context) {
    // Initial page at <home>
    final pages = [
      const LibrarianAddBookPage(),
      const LibrarianHomePage(),
      const LibrarianComplaintPage(),
    ];
    // Items of bottom bar
    final items = <BottomBarItemModel>[
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconInputInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('input'.tr),
        activeIcon: SvgPicture.asset(AppAssets.addBook),
      ),
      BottomBarItemModel(
        icon: SvgPicture.asset(
          AppAssets.iconHomeInactive,
          colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
        ),
        title: Text('home'.tr),
        activeIcon: SvgPicture.asset(AppAssets.libHome),
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
      extendBody: true,
      body: pages[pageIndex],
      bottomNavigationBar: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        backgroundColor: Colors.indigo[50],
        curve: Curves.decelerate,
        selectedItemColor: Colors.brown,
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
