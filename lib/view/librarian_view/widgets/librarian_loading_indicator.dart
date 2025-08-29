import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smartpath/core/utils/app_colors.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
          child: SpinKitSpinningLines(
            color: color ?? getColor().buttonText.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
