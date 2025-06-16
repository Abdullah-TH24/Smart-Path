import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/general_utils/app_styles.dart';

class AppBarWelcomeRow extends StatelessWidget {
  const AppBarWelcomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi',
                style: AppStyles.styleRegular16().copyWith(color: Colors.white),
              ),
              // TODO here to put student name from shared preference after link login page
              Text(
                'Abdullah Hamid',
                style: AppStyles.styleMedium20().copyWith(color: Colors.white),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
