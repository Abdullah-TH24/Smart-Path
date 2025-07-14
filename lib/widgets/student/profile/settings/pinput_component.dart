import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputComponent extends StatelessWidget {
  final TextEditingController pin;
  final void Function(String)? onCompleted;
  const PinputComponent({super.key, required this.pin, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pin,
      length: 4,
      onCompleted: onCompleted,
      obscureText: true,
      showCursor: false,
      obscuringWidget: const Icon(
        Icons.circle,
        size: 7.5,
        color: Colors.indigo,
      ),
      defaultPinTheme: PinTheme(
        width: 40,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(12.5),
        ),
      ),
    );
  }
}
