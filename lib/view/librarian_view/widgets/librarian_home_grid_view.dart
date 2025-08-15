import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpath/models/student_model/home/grid_item_model.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class LibrarianHomeGridView extends StatelessWidget {
  final List<GridItemModel> gridItems;
  const LibrarianHomeGridView({super.key, required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 48, horizontal: 12),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: gridItems[index].onTap,
          child: Card(
            color: const Color.fromARGB(199, 231, 218, 205),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(gridItems[index].assetName, width: 32),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
