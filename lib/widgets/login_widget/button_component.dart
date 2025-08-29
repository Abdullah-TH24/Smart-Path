import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  const ButtonComponent({
    super.key,
    required this.onPressed,
    required this.child,
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
      ),
      child: child,
    );
  }
}
