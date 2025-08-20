import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class StudentGridViewHome extends StatelessWidget {
  final List<GridItemModel> gridItems;
  const StudentGridViewHome({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 48, horizontal: 12),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.77 / 2.5,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: gridItems[index].onTap,
          child: Card(
            color: const Color.fromARGB(200, 200, 204, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(gridItems[index].assetName, width: 28),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    gridItems[index].title,
                    style: AppStyles.styleRegular12(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: gridItems.length,
      ),
    );
  }
}
