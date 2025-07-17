// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/controller/login_controller/logout_controller.dart';
import 'package:smartpath/controller/student_controller/home/home_page_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/profile/list_tile_item_model.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';
import 'package:smartpath/widgets/student/profile/profil_name_photo_row_component.dart';
import 'package:smartpath/widgets/student/profile/profile_list_tile_item_component.dart';
import 'package:smartpath/widgets/student/profile/upper_waves_component.dart';

class StudentProfilePage extends StatelessWidget {
  StudentProfilePage({super.key});

  HomePageController controller = Get.put(HomePageController());
  LogoutController authController = Get.put(LogoutController());
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final items = <ListTileItemModel>[
      ListTileItemModel(
        title: "profile_info_title".tr,
        assetName: AppAssets.iconEditProfile,
        onTap: () {
          locale.changeLanguage('en');
          Get.toNamed(
            AppRoutes.studentProfileInfo,
            arguments: controller.studentInfo,
          );
        },
      ),
      ListTileItemModel(
        title: "Settings".tr,
        assetName: AppAssets.iconChangePassword,
        onTap: () {
          Get.toNamed(AppRoutes.studentProfileSettings);
        },
        icon: Icons.settings,
      ),
      ListTileItemModel(
        title: "about".tr,
        assetName: AppAssets.iconAbout,
        onTap: () {
          Get.toNamed(AppRoutes.studentProfileAbout);
        },
      ),
      ListTileItemModel(
        title: "help".tr,
        assetName: AppAssets.iconHelp,
        onTap: () {},
      ),
      ListTileItemModel(
        title: "contact".tr,
        assetName: AppAssets.iconContact,
        onTap: () {
          Get.toNamed(AppRoutes.studentProfileContact);
        },
      ),
      ListTileItemModel(
        title: "sign_out".tr,
        assetName: AppAssets.iconSignout,
        onTap: () async {
          await authController.logout();
          if (authController.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(authController.errorMessage!)),
            );
            return;
          }
          if (authController.response != null) {
            if (authController.response!) {
              prefs!.remove('token');
              Get.offAllNamed(AppRoutes.loginRoute);
              pageIndex = 0;
            }
          }
        },
      ),
    ];
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return (controller.isLoading)
            ? const Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            )
            : (controller.errorMessage != null)
            ? Center(child: Image.asset(AppAssets.noInternet))
            : Scaffold(
              body: CustomScrollView(
                slivers: [
                  // Curve appbar with title of the page
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 80,
                    flexibleSpace: FlexibleSpaceBar(
                      background: const UpperWaves(),
                      titlePadding: const EdgeInsets.only(
                        left: 16,
                        bottom: 8,
                        right: 16,
                      ),
                      title: Text(
                        'title_page'.tr,
                        style: AppStyles.styleMedium14().copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // Student Info<image, <hi> word, name>
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Gap(12),
                        ProfileNamePhotoRow(
                          studentName:
                              '${controller.studentInfo!.fullName!.split(' ')[0][0].toUpperCase()}${controller.studentInfo!.fullName!.split(' ')[0].substring(1)} ${controller.studentInfo!.fullName!.split(' ')[2][0].toUpperCase()}${controller.studentInfo!.fullName!.split(' ')[2].substring(1)}',
                        ),
                        const Gap(32),
                        ...items.map((e) => ProfileListTileItem(item: e)),
                      ],
                    ),
                  ),
                ],
              ),
            );
      },
    );
  }
}
