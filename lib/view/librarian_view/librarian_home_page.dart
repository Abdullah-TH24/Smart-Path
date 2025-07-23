// ignore_for_file: unused_local_variable, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/services/librarian_services/get_books_service.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_home_grid_view.dart';
import 'package:smartpath/widgets/student/home/events_in_home_page.dart';
import 'package:smartpath/widgets/student/home/my_custom_app_bar_delegate.dart';
import 'package:smartpath/widgets/student/home/student_grid_view_home.dart';
import 'package:smartpath/widgets/student/home/welcome_item.dart';

class LibrarianHomePage extends StatelessWidget {
  const LibrarianHomePage({super.key});
  static final gridItems = <GridItemModel>[
    GridItemModel(
      assetName: AppAssets.iconBooks,
      title: 'lib_grid_1'.tr,
      onTap: () {
        // dynamic data = await GetBooksService().fetchBooks();
        // log(data[1].serialNumber + " " + data[0].serialNumber);
      },
    ),
    GridItemModel(
      assetName: AppAssets.iconBookShelf,
      title: 'lib_grid_2'.tr,
      onTap: () {
        Get.toNamed(AppRoutes.studentCourses);
      },
    ),
    GridItemModel(
      assetName: AppAssets.iconBorrowRequest,
      title: 'lib_grid_3'.tr,
      onTap: () {},
    ),
    GridItemModel(
      assetName: AppAssets.iconAcceptBorrow,
      title: 'lib_grid_4'.tr,
      onTap: () {
        Get.toNamed(AppRoutes.studentCalendar);
      },
    ),
    GridItemModel(
      assetName: AppAssets.iconRejectBorrow,
      title: 'lib_grid_5'.tr,
      onTap: () {
        Get.toNamed(AppRoutes.studentExams);
      },
    ),
    GridItemModel(
      assetName: AppAssets.iconQuiz,
      title: 'grid_item_name_4'.tr,
      onTap: () {},
    ),
    GridItemModel(
      assetName: AppAssets.iconTeacher,
      title: 'grid_item_name_5'.tr,
      onTap: () {},
    ),
    GridItemModel(
      assetName: AppAssets.iconStats,
      title: 'grid_item_name_6'.tr,
      onTap: () {
        // Get.toNamed(AppRoutes.studentGrades);
      },
    ),
    GridItemModel(
      assetName: AppAssets.iconAchievment,
      title: 'grid_item_name_7'.tr,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    log(prefs!.getString('token')!);
    return CustomScrollView(
      slivers: [
        // <AppBar>
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: MyCustomAppBarDelegate(
            expandedHeight: 180,
            collapsedHeight: 110,
            studentName: "librarian",
            imagePath: AppAssets.gredientBrownBackground,
            searchButton: const Color(0xff5e472c),
          ),
        ),
        // Content
        LibrarianHomeGridView(gridItems: gridItems),
      ],
    );
  }
}
