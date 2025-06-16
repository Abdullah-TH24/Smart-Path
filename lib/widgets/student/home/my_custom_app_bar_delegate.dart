import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/general_utils/app_assets.dart';
import 'package:smartpath/widgets/student/home/app_bar_after_scroll.dart';
import 'package:smartpath/widgets/student/home/app_bar_welcome_row.dart';
import 'package:smartpath/widgets/student/home/custom_search_bar.dart';

class MyCustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  MyCustomAppBarDelegate({
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double width = MediaQuery.sizeOf(context).width;
    final double contentOpacity =
        (1.0 - (shrinkOffset / (maxExtent - minExtent))).clamp(0.0, 1.0);
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        // --- Layer 1: The Persistent Background Image ---
        // This is the content from your old `flexibleSpace.background`
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.gredientBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Logo with tille and actions
        AppBarAfterScroll(),
        // --- Layer 2: The Content That Fades Away ---
        // This is the content from your old `flexibleSpace.child`
        Positioned(
          bottom: 35,
          width: width,
          child: IntrinsicWidth(
            child: Opacity(
              opacity: contentOpacity,
              child: const AppBarWelcomeRow(),
            ),
          ),
        ),
        // --- Layer 1: Search bar widget ---
        const Positioned(
          bottom: -22.5,
          right: 24,
          left: 24,
          child: CustomSearchBar(),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return expandedHeight != oldDelegate.maxExtent ||
        collapsedHeight != oldDelegate.minExtent;
  }
}
