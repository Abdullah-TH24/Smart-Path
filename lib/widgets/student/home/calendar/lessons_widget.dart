// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(7, (index) {
          if (false) return Image.asset(AppAssets.noData);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number of lesson
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    '${index + 1}',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo[50],
                    ),
                  ),
                ),
                const Gap(25),
                // Subject
                Container(
                  width: 255,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 200, 204, 233),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mathmatic',
                        style: AppStyles.styleBold22().copyWith(fontSize: 20),
                      ),
                      const Gap(10),
                      const Text('08:30AM - 09:15AM'),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
