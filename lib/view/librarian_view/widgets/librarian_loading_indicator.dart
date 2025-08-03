import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LibrarianLoadingIndicator extends StatelessWidget {
  const LibrarianLoadingIndicator({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6, // or double.infinity
        child: Center(
          child: SpinKitFadingCube(color: color ?? Colors.brown[400]),
        ),
      ),
    );
  }
}
