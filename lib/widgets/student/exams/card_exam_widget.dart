import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';

class CardExam extends StatelessWidget {
  const CardExam({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.indigo[100],
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                // <icon>
                Container(
                  width: 100,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 25),
                // <Title, Time>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title, style: AppStyles.styleBold16()),
                    Text('10:30 AM - 3H', style: AppStyles.styleRegular16()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
