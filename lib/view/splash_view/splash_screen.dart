import 'package:flutter/material.dart';
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
                  Assets.pngLogo,
                  width: 151.84,
                  height: 172.4,
                  color: Colors.indigo, // TODO color
                  colorBlendMode: BlendMode.srcIn,
                ),
                const SizedBox(height: 25),
                Text(
                  'app_name'.tr,
                  style: AppStyles.styleBold24(
                    context,
                    color: const Color(0xff303030), // TODO color
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 125),
                  child: const SpinKitFadingGrid(
                    color: Colors.indigo, // TODO color
                    size: 30,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
