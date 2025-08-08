import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianBorrowRequests extends StatelessWidget {
  const LibrarianBorrowRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[LibrarianWaveAppBar(title: 'lib_grid_3'.tr)],
      ),
    );
  }
}
