import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/login_form_widget.dart';
import 'package:smartpath/widgets/login/logo_with_title_component.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/core/utils/general_utils/app_routes.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> login = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  HideShowPasswordController controller = Get.put(HideShowPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Gap(48),
            // Logo with title app
            const LogoWithTitle(),
            // Sign in with description
            TitleWithDesc(title: 'sign_in'.tr, desc: 'sign_in_desc'.tr),
            const Gap(44),
            // Form <E-mail, Password>
            LoginForm(login: login, email: email, password: password),
            const Gap(50),
            // <Sign In> button
            ButtonComponent(
              onPressed: () {
                prefs!.setString('login_state', 'true');
                Get.offAllNamed(AppRoutes.studentMainPageRoute);
              },
              data: 'sign_in'.tr,
            ),
            const Gap(48),
            // <Forget Password> button
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.resetPasswordRoute);
                controller.hidePassword();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                'forgot_password'.tr,
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular16().copyWith(
                  color: Colors.indigo[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
