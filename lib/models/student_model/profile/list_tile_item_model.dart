import 'package:flutter/material.dart';

class ListTileItemModel {
  final String? assetName;
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  ListTileItemModel({
    this.assetName,
    required this.title,
    required this.onTap,
    this.icon,
  });
}
