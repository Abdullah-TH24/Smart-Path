import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CustomTextButtonCommentPage extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomTextButtonCommentPage({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Colors.black54,
        overlayColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      child: Text(
        title,
        style: AppStyles.styleRegular12().copyWith(color: Colors.black54),
      ),
    );
  }
}
