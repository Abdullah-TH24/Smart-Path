import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianProfilePage extends StatelessWidget {
  const LibrarianProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [LibrarianWaveAppBar(title: 'profile'.tr)],
      ),
    );
  }
}
