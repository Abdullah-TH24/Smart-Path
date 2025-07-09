import 'package:flutter/material.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CalendarAppBarComponent(data: 'Class'),
          SliverToBoxAdapter(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder:
                  (context, index) => Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 120,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          left: 40,
                          child: Container(
                            padding: const EdgeInsets.only(left: 50),
                            decoration: BoxDecoration(
                              color: Colors.indigo[100],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Student ${index + 1}',
                                      style: AppStyles.styleBold16(),
                                    ),
                                    const Text('GPA: 75'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 10,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.indigo,
                            child: Text(
                              '${index + 1}',
                              style: AppStyles.styleBold24().copyWith(
                                color: Colors.indigo[50],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
