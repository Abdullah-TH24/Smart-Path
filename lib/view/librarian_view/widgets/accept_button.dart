import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/librarian_controller/borrow_cubits/borrow_cubit.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    super.key,
    required this.id,
    required this.dueDateFormat,
  });

  final int id;
  final String dueDateFormat;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await context.read<BorrowCubit>().modifyBorrow({
          'borrow_id': id.toString(),
          'borrow_status': 'accepted',
          'due_date': dueDateFormat,
          'book_status': 'borrowed',
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      child: Text('accept'.tr),
    );
  }
}
