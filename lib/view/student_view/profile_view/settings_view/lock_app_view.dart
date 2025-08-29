import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/profile_controller/settings_controller/lock_app_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/lock_app_app_bar_widget.dart';
import 'package:smartpath/widgets/student_widget/profile_widget/settings/switch_component.dart';

class LockAppPage extends StatelessWidget {
  const LockAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const LockAppAppBarWidget(),
          SliverToBoxAdapter(
            child: GetBuilder<LockAppController>(
              init: LockAppController(),
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text('lock_title'.tr, style: AppStyles.styleBold16()),
                      SwitchComponent(
                        title: 'Lock App'.tr,
                        value: controller.enableLookScreen,
                        onChanged: (value) {
                          controller.lockScreen(value);
                          prefs!.setBool('lock_screen', value);
                          if (!value) {
                            prefs!.setBool('biometric', false);
                            controller.biometric(false);
                          }
                        },
                      ),
                      SwitchComponent(
                        title: 'fingerprint_title'.tr,
                        value: controller.enableBiometric,
                        onChanged: (!controller.enableLookScreen)
                            ? null
                            : (value) {
                                controller.biometric(value);
                                prefs!.setBool('biometric', value);
                              },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Divider
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(color: Colors.black54),
            ),
          ),
          // Change PIN code
          SliverToBoxAdapter(
            child: GetBuilder<LockAppController>(
              builder: (controller) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: (!controller.enableLookScreen)
                        ? null
                        : () {
                            Get.toNamed(AppRoutes.studentProfileEnterPIN);
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12.5),
                    ),
                    title: Text(
                      'change_title'.tr,
                      style: TextStyle(
                        color: (!controller.enableLookScreen)
                            ? Colors.black38
                            : null,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: (!controller.enableLookScreen)
                          ? Colors.black38
                          : Colors.indigo,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
