// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/controller/localization_controller/localization_controller.dart';
import 'package:smartpath/models/student_model/profile/list_tile_item_model.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class ProfileListTileItem extends StatelessWidget {
  final ListTileItemModel item;
  ProfileListTileItem({super.key, required this.item});

  LocalizationController locale = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12.5),
            ),
            leading:
                (item.icon != null)
                    ? Icon(item.icon, color: Colors.indigo)
                    : SvgPicture.asset(item.assetName!),
            title: Text(
              item.title,
              style: AppStyles.styleMedium14().copyWith(),
            ),
            trailing: Icon(
              (Get.locale?.languageCode ?? 'en') == 'en'
                  ? LucideIcons.chevronRight
                  : LucideIcons.chevronLeft,
              size: 22,
              color: const Color(0xffA0A0A0),
            ),
            onTap: item.onTap,
          ),
        ),
        const Divider(indent: 30, endIndent: 30),
      ],
    );
  }
}
