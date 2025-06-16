import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';
import 'package:smartpath/models/student_model/profile/profile_info_model.dart';

class GridInfo extends StatelessWidget {
  const GridInfo({super.key, required this.info});

  final List<ProfileInfoModel> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
        ),
        itemCount: info.length,
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${info[index].title}:', style: AppStyles.styleBold16()),
                  const Gap(5),
                  Text(
                    info[index].content,
                    style: AppStyles.styleRegular14().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
