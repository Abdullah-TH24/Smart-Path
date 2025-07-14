import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartpath/widgets/student/home/exams/time_line_exam_item_widget.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class Exams extends StatelessWidget {
  const Exams({super.key});

  @override
  Widget build(BuildContext context) {
    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final List<Map<String, dynamic>> exams = [
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 1],
        'title': 'Mathmatic',
        'icon': LucideIcons.calculator,
      },
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 1],
        'title': 'Physics',
        'icon': LucideIcons.atom,
      },
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 1],
        'title': 'Computer',
        'icon': LucideIcons.laptop,
      },
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 2],
        'title': 'English',
        'icon': LucideIcons.languages,
      },
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 1],
        'title': 'Chemistry',
        'icon': LucideIcons.testTube2,
      },
      {
        'day': '${DateTime.now().day}',
        'month': monthNames[DateTime.now().month - 1],
        'title': 'Sciences',
        'icon': LucideIcons.microscope,
      },
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarComponent(data: 'Exams Schedule'),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: exams.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final exam = exams[index];
                return TimelineExamItem(
                  day: exam['day'],
                  month: exam['month'],
                  title: exam['title'],
                  icon: exam['icon'],
                  isLast: index == exams.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
