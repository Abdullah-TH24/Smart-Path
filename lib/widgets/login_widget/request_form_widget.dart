import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/login_controller/verify_email_controller_for_request.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({
    super.key,
    required this.requestResetPassword,
    required this.email,
  });

  final GlobalKey<FormState> requestResetPassword;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: requestResetPassword,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // <E-mail> word
          Text(
            'email'.tr,
            style: AppStyles.styleRegular16().copyWith(
              color: Colors.indigo[400],
            ),
          ),
          // <E-mail> field
          TextFormField(
            controller: email,
            validator: (value) => verifyEmailForRequest(value, value!.length),
            style: const TextStyle(color: Colors.indigo),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
