// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/events_controller.dart';
import 'package:smartpath/controller/student_controller/home/home_page_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/widgets/student/home/events_in_home_page.dart';
import 'package:smartpath/widgets/student/home/my_custom_app_bar_delegate.dart';
import 'package:smartpath/widgets/student/home/student_grid_view_home.dart';
import 'package:smartpath/widgets/student/home/welcome_item.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    final EventsController eventsController = Get.put(EventsController());
    final gridItems = <GridItemModel>[
      GridItemModel(
        assetName: AppAssets.iconClass,
        title: 'grid_item_name_0'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentClass);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconBook,
        title: 'grid_item_name_1'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentCourses);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconCase,
        title: 'grid_item_name_2'.tr,
        onTap: () {},
      ),
      GridItemModel(
        assetName: AppAssets.iconCalendar,
        title: 'grid_item_name_3'.tr,
        onTap: () {
          Get.toNamed(AppRoutes.studentCalendar);
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconStudent,
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
          Get.toNamed(
            AppRoutes.studentFilterPage,
            arguments: {
              'name':
                  "${controller.studentInfo!.fullName!.split(' ')[0][0].toUpperCase()}${controller.studentInfo!.fullName!.split(' ')[0].substring(1)} ${controller.studentInfo!.fullName!.split(' ')[1][0]}${controller.studentInfo!.fullName!.split(' ')[2][0]}",
              'years':
                  controller.studentInfo!.profileData!.numberOfAttendanceYears,
            },
          );
        },
      ),
      GridItemModel(
        assetName: AppAssets.iconAchievment,
        title: 'grid_item_name_7'.tr,
        onTap: () {},
      ),
      GridItemModel(
        assetName: AppAssets.iconCase,
        title: 'grid_item_name_9'.tr,
        onTap: () {},
      ),
      GridItemModel(
        assetName: AppAssets.iconLamp,
        title: 'grid_item_name_10'.tr,
        onTap: () {},
      ),
      GridItemModel(
        assetName: AppAssets.iconBook,
        title: 'grid_item_name_11'.tr,
        onTap: () {},
      ),
    ];
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
        return (homePageController.isLoading)
            ? const Center(child: SpinKitSpinningLines(color: Colors.indigo))
            : (homePageController.errorMessage != null)
            ? Center(child: Image.asset(AppAssets.noInternet))
            : CustomScrollView(
              slivers: [
                // <AppBar>
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: MyCustomAppBarDelegate(
                    expandedHeight: 180,
                    collapsedHeight: 110,
                    studentName:
                        "${controller.studentInfo!.fullName?.split(' ')[0][0].toUpperCase()}${controller.studentInfo!.fullName!.split(' ')[0].substring(1)} ${controller.studentInfo!.fullName!.split(' ')[1][0].toUpperCase()}${controller.studentInfo!.fullName!.split(' ')[2][0].toUpperCase()}",
                  ),
                ),
                // Content
                StudentGridViewHome(gridItems: gridItems),
                // welcome image
                WelcomeItem(),
                // Events
                const EventsInHomePage(),
              ],
            );
      },
    );
  }
}
