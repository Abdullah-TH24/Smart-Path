// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';
import 'package:smartpath/view/student_view/student_main_page.dart';
import 'package:smartpath/widgets/student/profile/profil_name_photo_row_component.dart';
import 'package:smartpath/widgets/student/profile/profile_list_tile_item_component.dart';

class LibrarianProfilePage extends StatelessWidget {
  LibrarianProfilePage({super.key});

  HomePageController controller = Get.put(HomePageController());
  LogoutController authController = Get.put(LogoutController());
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final items = <ListTileItemModel>[
      ListTileItemModel(
        title: "Settings".tr,
        assetName: AppAssets.libSettings,
        onTap: () {
          Get.toNamed(LibrarianRoutes.settings);
        },
        icon: Icons.settings,
      ),
      ListTileItemModel(
        title: "sign_out".tr,
        assetName: AppAssets.libSignout,
        onTap: () async {
          await authController.logout();
          if (authController.errorMessage != null) {
            showSnackbar('Error', authController.errorMessage!);
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve appbar with title of the page
          LibrarianWaveAppBar(title: 'profile'.tr),

          SliverToBoxAdapter(
            child: Column(
              children: [
                const Gap(12),
                ProfileNamePhotoRow(
                  studentName: 'librarian',
                  color: Colors.brown[100],
                ),
                const Gap(32),
                ...items.map((e) => ProfileListTileItem(item: e)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
