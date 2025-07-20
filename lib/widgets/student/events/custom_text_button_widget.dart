import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String title;
  final IconData icon;
  final Color? foregroundColor;
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
    this.onLongPress,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onLongPress: onLongPress,
      onPressed: onPressed,
      label: Text(title),
      icon: Icon(icon),
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: foregroundColor ?? Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
