import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class ComplaintCardWidget extends StatelessWidget {
  const ComplaintCardWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      color: getColor().textField,
      shadowColor: getColor().buttonText.withValues(alpha: 0.2),
      child: ListTile(
        leading: const Icon(Icons.markunread_outlined),
        title: Text(
          title,
          style: AppStyles.styleBold16().copyWith(color: getColor().buttonText),
        ),
        trailing: const Icon(LucideIcons.chevronRight),
      ),
    );
  }
}
