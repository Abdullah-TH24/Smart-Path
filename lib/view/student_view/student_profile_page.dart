import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/models/profile_tile_item_model.dart';
import 'package:smartpath/utils/general_utils/app_assets.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';
import 'package:smartpath/view/student_view/profile_list_tile_item.dart';
import 'package:smartpath/view/student_view/profile_name_photo_row.dart';
import 'package:smartpath/view/student_view/upper_waves.dart';

class StudentProfilePage extends StatelessWidget {
  StudentProfilePage({super.key});
  final List<ProfileTileItemModel> items = [
    ProfileTileItemModel(
      title: "Edit Profile",
      image: Assets.iconEditProfile,
      onTap: () {},
    ),
    ProfileTileItemModel(
      title: "Change Password",
      image: Assets.iconChangePassword,
      onTap: () {},
    ),
    ProfileTileItemModel(title: "About", image: Assets.iconAbout, onTap: () {}),
    ProfileTileItemModel(title: "HElp", image: Assets.iconHelp, onTap: () {}),
    ProfileTileItemModel(
      title: "Contact",
      image: Assets.iconContact,
      onTap: () {},
    ),
    ProfileTileItemModel(
      title: "Sign Out",
      image: Assets.iconSignout,
      onTap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              background: const UpperWaves(),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 8),
              title: Text(
                'Your Profile',
                style: AppStyles.styleMedium14().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
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
