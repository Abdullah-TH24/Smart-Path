import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/library_controller/borrow_cubits/borrow_cubit.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await context.read<BorrowCubit>().modifyBorrow({
          'borrow_id': id.toString(),
          'borrow_status': 'rejected',
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(207, 247, 51, 37),
        elevation: 0,
      ),
      child: Text('reject'.tr),
    );
  }
}
