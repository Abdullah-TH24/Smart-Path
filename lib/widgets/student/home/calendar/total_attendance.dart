import 'package:flutter/material.dart';

class TotalAttendance extends StatelessWidget {
  const TotalAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 200, 204, 233),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total attendance'),
            Row(
              children: List.generate(
                7,
                (index) => Container(
                  height: 10,
                  width: 15,
                  margin: const EdgeInsets.only(left: 2.5),
                  decoration: BoxDecoration(
                    color: (index != 6) ? Colors.green[600] : Colors.red[600],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
