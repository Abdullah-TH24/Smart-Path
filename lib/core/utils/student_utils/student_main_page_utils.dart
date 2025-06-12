import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/models/student_model/bottom_bar_item_model.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/view/student_view/data/student_data_page.dart';
import 'package:smartpath/view/student_view/home/student_home_page.dart';
import 'package:smartpath/view/student_view/portfolio/student_portfolio_page.dart';
import 'package:smartpath/view/student_view/profile/student_profile_page.dart';

// Initial page at <home>
int pageIndex = 0;
final List<StatelessWidget> pages = [
  const StudentHomePage(),
  const StudentPortfolioPage(),
  const StudentDataPage(),
  const StudentProfilePage(),
];
// Items of bottom bar
final List<BottomBarItemModel> items = [
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
