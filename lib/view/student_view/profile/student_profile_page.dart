import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/core/utils/student_utils/profile_utils/student_profile_page_utils.dart';
import 'package:smartpath/widgets/student/profile/profil_name_photo_row.dart';
import 'package:smartpath/widgets/student/profile/profile_list_tile_item.dart';
import 'package:smartpath/widgets/student/profile/upper_waves.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve appbar with title of the page
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              background: const UpperWaves(),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 8),
              title: Text(
                'title_page'.tr,
                style: AppStyles.styleMedium14().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Student Info<image, <hi> word, name>
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Gap(12),
                const ProfileNamePhotoRow(),
                const Gap(32),
                ...items.map((e) => ProfileListTileItem(item: e)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
