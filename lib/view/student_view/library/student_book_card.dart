import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

class StudentBookCard extends StatelessWidget {
  const StudentBookCard({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(200, 200, 204, 233),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 120,
              child: FittedBox(
                fit: BoxFit.contain,
                //818CF8
                child: SvgPicture.asset(AppAssets.studentBook),
              ),
            ),
            const Gap(8),
            Text('${'title'.tr}: ${bookModel.title}'),
            const Gap(8),
            Text(
              '${'author'.tr}: ${bookModel.author}',
              style: AppStyles.styleRegular12(),
            ),
            const Gap(8),
            Text(
              '${'shelf_location'.tr}: ${bookModel.shelfLocation}',
              style: AppStyles.styleRegular12(),
            ),
          ],
        ),
      ),
    );
  }
}
