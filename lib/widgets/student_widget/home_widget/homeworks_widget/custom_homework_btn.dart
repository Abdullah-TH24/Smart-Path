
import 'package:flutter/material.dart';
import 'package:smartpath/view/student_view/home_view/homeworks_view/homeworks_view.dart';

class CustomHomeworkBtn extends StatelessWidget {
  final void Function()? onPressed;
  final int indexOp;
  final String title;
  final OperationType controller;
  const CustomHomeworkBtn({
    super.key,
    this.onPressed,
    required this.indexOp,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12.5),
          side: const BorderSide(color: Colors.indigo),
        ),
        backgroundColor: (controller.indexOp == indexOp)
            ? Colors.indigo
            : Colors.transparent,
        elevation: (controller.indexOp == indexOp) ? null : 0,
        foregroundColor: (controller.indexOp == indexOp)
            ? Colors.indigo[50]
            : Colors.indigo,
      ),
      child: Text(title),
    );
  }
}
