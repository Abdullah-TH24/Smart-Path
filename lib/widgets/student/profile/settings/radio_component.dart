import 'package:flutter/material.dart';

class RadioComponent extends StatelessWidget {
  final String title;
  final int value;
  final int groupLangauge;
  final ValueChanged<int?>? onChanged;
  const RadioComponent({
    super.key,
    required this.groupLangauge,
    this.onChanged,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      title: Text(title),
      value: value,
      groupValue: groupLangauge,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12.5),
      ),
      activeColor: Colors.indigo,
    );
  }
}
