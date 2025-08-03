import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpath/core/utils/app_assets.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(18),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Center(child: SvgPicture.asset(AppAssets.borrowManage)),
      ),
    );
  }
}
