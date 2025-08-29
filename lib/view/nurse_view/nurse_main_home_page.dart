import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smartpath/models/student_model/bottom_bar_item_model.dart';
import 'package:smartpath/view/nurse_view/nurse_add_medical_file_page.dart';
import 'package:smartpath/view/nurse_view/nurse_all_medical_files_page.dart';
import 'package:smartpath/view/nurse_view/nurse_studens_search_page.dart';

class NurseMainHomePage extends StatefulWidget {
  const NurseMainHomePage({super.key});

  @override
  State<NurseMainHomePage> createState() => _NurseMainHomePageState();
}

int pageIndex = 1;

class _NurseMainHomePageState extends State<NurseMainHomePage> {
  @override
  Widget build(BuildContext context) {
    // Initial page at <home>
    final pages = [
      const NurseAllMedicalFilesPage(),
      const NurseAddMedicalFilePage(),
      const NurseStudensSearchPage(),
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
        activeIcon: SvgPicture.asset(AppAssets.libProfile),
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
