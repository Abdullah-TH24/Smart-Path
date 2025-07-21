import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/controller/student_controller/profile/contact_controller.dart';

class ButtonContactWidget extends StatelessWidget {
  const ButtonContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(5),
            ElevatedButton.icon(
              onPressed: () => makePhoneCall('+966123456789'),
              icon: const Icon(Icons.phone),
              label: Text('button_call'.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
              ),
            ),
            const Gap(10),
            ElevatedButton.icon(
              onPressed: () => sendEmail('info@alriyada.edu.sa'),
              icon: const Icon(Icons.email),
              label: Text('button_send'.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
              ),
            ),
            const Gap(10),
            ElevatedButton.icon(
              onPressed: () => openWebsite('https://www.alriyada.edu.sa'),
              icon: const Icon(Icons.language),
              label: Text('button_visitW'.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
              ),
            ),
            const Gap(10),
            ElevatedButton.icon(
              onPressed:
                  () =>
                      openFacebook('https://www.facebook.com/alriyada.school'),
              icon: const Icon(Icons.facebook),
              label: Text('button_visitF'.tr),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12.5),
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
