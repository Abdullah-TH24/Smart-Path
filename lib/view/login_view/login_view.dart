import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/controller/login_controller/login_controller.dart';
import 'package:smartpath/core/utils/app_routes.dart';
import 'package:smartpath/widgets/login_widget/login_button_widget.dart';
import 'package:smartpath/widgets/login_widget/login_form_widget.dart';
import 'package:smartpath/widgets/login_widget/logo_with_title_component.dart';
import 'package:smartpath/controller/login_controller/hide_show_password_controller.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login_widget/title_with_desc_component.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> login = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  HideShowPasswordController controller = Get.put(HideShowPasswordController());
  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
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
            LoginButton(
              loginController: loginController,
              login: login,
              email: email,
              password: password,
              locale: locale,
            ),
            const Gap(48),
            // <Forget Password> button
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.requestResetPassword);
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
