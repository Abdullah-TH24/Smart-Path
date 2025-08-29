import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/home_model/grid_item_model.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_home_grid_view.dart';
import 'package:smartpath/widgets/student_widget/home_widget/my_custom_app_bar_delegate.dart';

class LibrarianHomePage extends StatelessWidget {
  const LibrarianHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log(prefs!.getString('token')!);
    return CustomScrollView(
      slivers: [
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

final gridItems = <GridItemModel>[
  GridItemModel(
    assetName: AppAssets.iconBooks,
    title: 'lib_grid_1'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.books);
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconBookShelf,
    title: 'lib_grid_2'.tr,
    onTap: () {
      // Get.toNamed(AppRoutes.studentCourses);
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconBorrowRequest,
    title: 'lib_grid_3'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.borrowRequests);
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconAcceptBorrow,
    title: 'lib_grid_4'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.borrowAcceptedRequests);
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconRejectBorrow,
    title: 'lib_grid_5'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.borrowRejectedRequests);
    },
  ),
  GridItemModel(
    assetName: AppAssets.libComplaint,
    title: 'lib_grid_6'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.complaints);
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconHistoryLib,
    title: 'lib_grid_7'.tr,
    onTap: () {
      Get.toNamed(LibrarianRoutes.userComplaints);
    },
  ),
];
