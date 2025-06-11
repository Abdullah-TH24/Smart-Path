import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/models/profile_tile_item_model.dart';
import 'package:smartpath/utils/general_utils/app_styles.dart';

class ProfileListTileItem extends StatelessWidget {
  const ProfileListTileItem({super.key, required this.item});

  final ProfileTileItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: item.onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          leading: SvgPicture.asset(item.image),
          title: Text(item.title, style: AppStyles.styleMedium14()),
          trailing: const Icon(
            LucideIcons.chevronRight,
            size: 22,
            color: Color(0xffA0A0A0),
          ),
        ),
        const Divider(endIndent: 30, indent: 30),
      ],
    );
  }
}
