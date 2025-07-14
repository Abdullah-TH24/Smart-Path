
import 'package:flutter/material.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: const Center(
        child: Text('List of courses will be here.'),
      ),
    );
  }
}
