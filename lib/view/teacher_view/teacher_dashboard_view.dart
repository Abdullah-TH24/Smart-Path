
import 'package:flutter/material.dart';

class TeacherDashboardView extends StatelessWidget {
  const TeacherDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome, Teacher!'),
      ),
    );
  }
}
