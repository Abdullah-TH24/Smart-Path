// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/models/librarian_model/borrow_model.dart';

class AcceptedRequestListTile extends StatelessWidget {
  const AcceptedRequestListTile({super.key, required this.borrows});

  final BorrowModel borrows;
  static final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(AppAssets.iconAcceptBorrow),
      title: Text(borrows.title),
      subtitle: Text(borrows.borrower.fullName),
      trailing: Text(
        borrows.dueDate!.difference(now).inDays.toInt() < 0
            ? 'expired'.tr
            : '${borrows.dueDate!.day} D',
      ),
    );
  }
}
