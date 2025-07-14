import 'package:flutter/material.dart';

class SwitchComponent extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChanged;
  const SwitchComponent({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        onChanged: onChanged,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.5),
        ),
      ),
    );
  }
}
