import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/controller/splash_controller/navigate_to_next_page.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: navigateToNextPage(),
          builder: (context, asyncSnapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height / 4 - 50),
                Image.asset(
                  AppAssets.pngLogo,
                  width: 151.84,
                  height: 172.4,
                  colorBlendMode: BlendMode.srcIn,
                  color: Colors.indigo,
                ),
                const Gap(25),
                Text(
                  'app_name'.tr,
                  style: AppStyles.styleBold24(),
                  textAlign: TextAlign.center,
                ),
                const Gap(125),
                const SpinKitFadingGrid(color: Colors.indigo, size: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
