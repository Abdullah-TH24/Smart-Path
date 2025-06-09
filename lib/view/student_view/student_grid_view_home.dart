import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';
import 'package:smartpath/models/home_grid_item_model.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';

class StudentGridViewHome extends StatelessWidget {
  const StudentGridViewHome({super.key});
  static final List<HomeGridItemModel> gItems = [
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_0'.tr,
      image: Assets.iconClass,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_1'.tr,
      image: Assets.iconAchievment,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_2'.tr,
      image: Assets.iconArticle,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_3'.tr,
      image: Assets.iconCalendar,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_4'.tr,
      image: Assets.iconQuiz,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_5'.tr,
      image: Assets.iconTeacher,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_6'.tr,
      image: Assets.iconFolder,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_7'.tr,
      image: Assets.iconStudent,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_8'.tr,
      image: Assets.iconStats,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_9'.tr,
      image: Assets.iconCase,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_10'.tr,
      image: Assets.iconLamp,
    ),
    HomeGridItemModel(
      onTap: () {},
      title: 'grid_item_name_11'.tr,
      image: Assets.iconBook,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 48, horizontal: 12),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: gItems[index].onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(gItems[index].image, width: 28),
                const Gap(16),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    gItems[index].title,
                    style: AppStyles.styleRegular12(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
