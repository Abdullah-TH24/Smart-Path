// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/models/librarian_model/borrow_model.dart';

class RejectedRequestListTile extends StatelessWidget {
  const RejectedRequestListTile({super.key, required this.borrows});

  final BorrowModel borrows;
  static final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(AppAssets.iconRejectBorrow),
      title: Text(borrows.title),
      subtitle: Text(borrows.borrower.fullName),
      trailing: const Text(
        'rejected',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
      ),
    );
  }
}
