// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/view/librarian_view/librarian_home_grid_view.dart';
import 'package:smartpath/widgets/student/home/events_in_home_page.dart';
import 'package:smartpath/widgets/student/home/my_custom_app_bar_delegate.dart';
import 'package:smartpath/widgets/student/home/student_grid_view_home.dart';
import 'package:smartpath/widgets/student/home/welcome_item.dart';

class LibrarianHomePage extends StatelessWidget {
  const LibrarianHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gridItems = <GridItemModel>[
      GridItemModel(
        assetName: AppAssets.iconBooks,
        title: 'grid_item_name_0'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentClass);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconBookShelf,
        title: 'grid_item_name_1'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentCourses);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconBorrowRequest,
        title: 'grid_item_name_2'.tr,
        onTap: () {},
      ),
      GridItemModel(
        assetName: AppAssets.iconAcceptBorrow,
        title: 'grid_item_name_3'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentCalendar);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconRejectBorrow,
        title: 'grid_item_name_8'.tr,
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
            searchButton: Color(0xff5e472c),
          ),
        ),
        // Content
        LibrarianHomeGridView(gridItems: gridItems),
        // welcome image
        WelcomeItem(),
        // Events
        const EventsInHomePage(),
      ],
    );
  }
}
