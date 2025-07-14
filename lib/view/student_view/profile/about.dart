import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarComponent(data: 'About'),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.pngLogo,
                    height: 150,
                    color: Colors.indigo,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  const Gap(10),
                  const Text('Smart Path'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About The App',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    'The Smart Pathh is a smart platform designed to enhance communication between the school, students, and parents. It offers easy and secure access to attendance records, academic performance, class schedules, assignments, and important announcements — all in one place.',
                  ),
                  const Gap(5),
                  const Divider(color: Colors.black54),
                  Text(
                    'About the School',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    'Al-Riyada Model School is a leading educational institution committed to academic excellence and providing a stimulating learning environment. Our goal is to combine quality education, strong values, and modern technology to serve our students and community',
                  ),
                  const Gap(5),
                  const Divider(color: Colors.black54),
                  Text(
                    'Contact Information',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                  const Gap(10),
                  const Text('Address: Education City, Al-Riyada Street'),
                  const Gap(5),
                  const Text('Phone: +966 123 456 789'),
                  const Gap(5),
                  const Text('Email: info@alriyada.edu.sa'),
                  const Gap(5),
                  const Text('Website: www.alriyada.edu.sa'),
                  const Gap(5),
                  const Text('Facebook: fb.com/alriyada.school'),
                  const Gap(5),
                  const Divider(color: Colors.black54),
                  Text(
                    'App Version',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                  const Gap(5),
                  const Text('Version 1.0.0'),
                  const Divider(color: Colors.black54),
                  Text(
                    'Copyright',
                    style: AppStyles.styleBold16().copyWith(
                      color: Colors.indigo,
                    ),
                  ),
                  const Gap(5),
                  const Text(
                    '© 2025 All rights reserved to Al-Riyada Model School',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
