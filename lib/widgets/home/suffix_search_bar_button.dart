import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SuffixSearchBarButton extends StatelessWidget {
  const SuffixSearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 28,
        height: 28,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 61, 194),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(LucideIcons.search, color: Colors.white, size: 14),
        ),
      ),
    );
  }
}
