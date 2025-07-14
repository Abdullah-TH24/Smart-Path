import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smartpath/controller/auth_controller/auth_controller.dart';
import 'package:smartpath/controller/auth_controller/go_to_next_page_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class FingerprintAuthWidget extends StatelessWidget {
  final AuthController controller;
  const FingerprintAuthWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('option_pin_title'.tr, style: AppStyles.styleRegular16()),
        const Gap(10),
        InkWell(
          onTap:
              controller.isLoading
                  ? null
                  : () async {
                    if (!controller.biometricAvailable) {
                      return;
                    }
                    controller.loading();
                    try {
                      final bool authenticate = await controller.auth
                          .authenticate(
                            localizedReason: 'bio_messagge'.tr,
                            options: const AuthenticationOptions(
                              biometricOnly: true,
                              stickyAuth: true,
                            ),
                          );
                      if (authenticate) {
                        goToNextPage();
                      }
                    } catch (e) {
                      print(e.toString());
                    } finally {
                      controller.stopLoading();
                    }
                  },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[200]!),
            ),
            child:
                controller.isLoading
                    ? const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.indigo),
                    )
                    : Icon(
                      Icons.fingerprint,
                      size: 38,
                      color: Colors.indigo[600],
                    ),
          ),
        ),
        const Gap(10),
        Text(
          'option_pin_desc'.tr,
          style: TextStyle(fontSize: 18, color: Colors.indigo[600]),
        ),
        const Gap(10),
      ],
    );
  }
}
