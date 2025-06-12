import 'package:get/get.dart';
import 'package:smartpath/core/models/student_model/profile/list_tile_item_model.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/main.dart';

final List<ListTileItemModel> items = [
  ListTileItemModel(
    title: "edit_profile".tr,
    assetName: AppAssets.iconEditProfile,
    onTap: () {},
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
      prefs!.clear();
      Get.offAllNamed(AppRoutes.loginRoute);
    },
  ),
];
