import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(title),
      icon: Icon(icon),
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.5),
        ),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
