// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/events/all_reactions_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/widgets/student/events/custom_tabs_widget.dart';
import 'package:smartpath/widgets/student/events/reactions_info_app_bar_widget.dart';
import 'package:smartpath/widgets/student/events/user_reactions_widget.dart';

class ReactionsInfoPage extends StatelessWidget {
  ReactionsInfoPage({super.key});
  int reactableId = Get.arguments['reactableId'];
  String reactableType = Get.arguments['reactableType'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ReactionsInfoAppBar(),
          SliverToBoxAdapter(
            child: GetBuilder<AllReactionsController>(
              init: AllReactionsController(
                reactableId: reactableId,
                reactableType: reactableType,
              ),
              builder: (controller) {
                return (controller.isLoading)
                    ? Container(
                      height: Get.height - 175,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Colors.indigo,
                      ),
                    )
                    : (controller.errorMessage != null)
                    ? Container(
                      height: Get.height - 200,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.noInternet),
                    )
                    : (controller.allReactions!.isEmpty)
                    ? Container(
                      height: Get.height - 175,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.noData),
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // <Tabs>
                        CustomTabs(controller: controller),
                        // Users
                        UserReactions(controller: controller),
                      ],
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
