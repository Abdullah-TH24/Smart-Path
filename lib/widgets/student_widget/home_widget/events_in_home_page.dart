import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class EventsInHomePage extends StatelessWidget {
  const EventsInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 25,
              bottom: 10,
            ),
            child: Text(
              'grid_item_name_7'.tr,
              style: AppStyles.styleMedium14(),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    height: 150,
                    width: 275,
                    margin:
                        (Get.locale?.languageCode ?? 'en') == 'en'
                            ? EdgeInsets.only(right: (index != 3) ? 16 : 0)
                            : EdgeInsets.only(left: (index != 3) ? 16 : 0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppAssets.events1),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(75),
        ],
      ),
    );
  }
}
