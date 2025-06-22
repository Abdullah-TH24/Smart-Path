// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/controller/student_controller/home/home_page_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/models/student_model/profile/list_tile_item_model.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';
import 'package:smartpath/widgets/student/profile/profil_name_photo_row.dart';
import 'package:smartpath/widgets/student/profile/profile_list_tile_item.dart';
import 'package:smartpath/widgets/student/profile/upper_waves.dart';

class StudentProfilePage extends StatelessWidget {
  StudentProfilePage({super.key});

  HomePageController controller = Get.put(HomePageController());
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<ListTileItemModel> items = [
      ListTileItemModel(
        title: "profile_info_title".tr,
        assetName: AppAssets.iconEditProfile,
        onTap: () {
          locale.changeLanguage('ar');
          Get.toNamed(
            AppRoutes.studentProfileInfo,
            arguments: controller.studentInfo,
          );
        },
      ),
      ListTileItemModel(
        title: "change_password".tr,
        assetName: AppAssets.iconChangePassword,
        onTap: () {},
      ),
      ListTileItemModel(
        title: "about".tr,
        assetName: AppAssets.iconAbout,
        onTap: () {},
      ),
      ListTileItemModel(
        title: "help".tr,
        assetName: AppAssets.iconHelp,
        onTap: () {},
      ),
      ListTileItemModel(
        title: "contact".tr,
        assetName: AppAssets.iconContact,
        onTap: () {},
      ),
      ListTileItemModel(
        title: "sign_out".tr,
        assetName: AppAssets.iconSignout,
        onTap: () {
          prefs!.remove('token');
          Get.offAllNamed(AppRoutes.loginRoute);
          pageIndex = 0;
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
                              '${controller.studentInfo?.name} ${controller.studentInfo?.lastName}',
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
