import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onPressed;
  final String data;
  const ButtonComponent({
    super.key,
    required this.onPressed,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(327, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        backgroundColor: Colors.indigo, // TODO
      ),
      child: Text(
        data,
        style: AppStyles.styleRegular22(
          context,
          color: const Color(0xffFFFFFF), // TODO color
        ),
      ),
    );
  }
}
