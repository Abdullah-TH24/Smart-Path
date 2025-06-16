import 'package:get/get.dart';
import 'package:smartpath/controller/localization/localization_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/view/student_view/home/calendar/calendar.dart';

LocalizationController locale = Get.find();

final List<GridItemModel> gridItems = [
  GridItemModel(
    assetName: AppAssets.iconClass,
    title: 'grid_item_name_0'.tr,
    onTap: () {
      locale.changeLanguage('ar');
      print('AR');
    },
  ),
  GridItemModel(
    assetName: AppAssets.iconBook,
    title: 'grid_item_name_1'.tr,
    onTap: () {
      locale.changeLanguage('en');
      print('EN');
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
    onTap: () {},
  ),
  GridItemModel(
    assetName: AppAssets.iconAchievment,
    title: 'grid_item_name_7'.tr,
    onTap: () {},
  ),
  GridItemModel(
    assetName: AppAssets.iconStudent,
    title: 'grid_item_name_8'.tr,
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
