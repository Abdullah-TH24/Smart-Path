
import 'package:flutter/material.dart';

class MyStudentsView extends StatelessWidget {
  const MyStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Students'),
      ),
      body: const Center(
        child: Text('List of students will be here.'),
      ),
    );
  }
}
