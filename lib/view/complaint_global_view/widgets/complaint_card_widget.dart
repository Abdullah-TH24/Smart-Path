import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class ComplaintCardWidget extends StatelessWidget {
  const ComplaintCardWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(198, 241, 228, 215),
      shadowColor: Colors.brown.withValues(alpha: 0.2),
      child: ListTile(
        leading: const Icon(Icons.markunread_outlined),
        title: Text(
          title,
          style: AppStyles.styleBold16().copyWith(color: Colors.brown),
        ),
        trailing: const Icon(LucideIcons.chevronRight),
      ),
    );
  }
}
