import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Teacher')),
      body: const Center(child: Text('Home View of Teacher will be here.')),
    );
  }
}
