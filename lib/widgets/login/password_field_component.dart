import 'package:flutter/material.dart';

class PasswordFieldComponent extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onPressed;
  final Widget icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  const PasswordFieldComponent({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.icon,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: onPressed, icon: icon),
      ),
      obscureText: obscureText,
      style: const TextStyle(color: Colors.indigo, fontSize: 20),
      keyboardType: TextInputType.visiblePassword,
      validator: validator,
    );
  }
}
