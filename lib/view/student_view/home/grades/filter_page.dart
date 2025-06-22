// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/login/button_component.dart';
import 'package:smartpath/widgets/login/title_with_desc_component.dart';
import 'package:smartpath/widgets/student/home/calendar/calendar_app_bar_widget.dart';

class FilterPage extends StatelessWidget {
  FilterPage({super.key});

  GlobalKey<FormState> filter = GlobalKey<FormState>();
  final String studentName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Curve AppBar
          const CalendarAppBarComponent(data: 'Filter'),
          //
          SliverToBoxAdapter(
            child: Form(
              key: filter,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).height - 80,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Gap(15),
                    TitleWithDesc(
                      title: 'Hi $studentName',
                      desc: 'we need some info to keep going',
                    ),
                    const Gap(85),
                    Text(
                      'Select a year',
                      style: AppStyles.styleRegular16().copyWith(
                        color: Colors.indigo[400],
                      ),
                    ),
                    Center(
                      child: DropdownMenu(
                        width: MediaQuery.sizeOf(context).width - 40,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: UnderlineInputBorder(),
                        ),
                        menuStyle: MenuStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.indigo[100],
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                            Size(MediaQuery.sizeOf(context).width - 40, 150),
                          ),
                        ),
                        textStyle: AppStyles.styleRegular16().copyWith(
                          color: Colors.indigo,
                        ),
                        dropdownMenuEntries: List.generate(
                          4,
                          (index) => DropdownMenuEntry(
                            value: '${2025 - index}',
                            label: '${2025 - index}',
                          ),
                        ),
                      ),
                    ),
                    const Gap(25),
                    Text(
                      'Select type',
                      style: AppStyles.styleRegular16().copyWith(
                        color: Colors.indigo[400],
                      ),
                    ),
                    Center(
                      child: DropdownMenu(
                        width: MediaQuery.sizeOf(context).width - 40,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: UnderlineInputBorder(),
                        ),
                        menuStyle: MenuStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.indigo[100],
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                            Size(MediaQuery.sizeOf(context).width - 40, 160),
                          ),
                        ),
                        textStyle: AppStyles.styleRegular16().copyWith(
                          color: Colors.indigo,
                        ),
                        dropdownMenuEntries: List.generate(
                          3,
                          (index) => DropdownMenuEntry(
                            value:
                                index == 0
                                    ? 'Final'
                                    : (index == 1)
                                    ? 'Mid'
                                    : 'Quiz',
                            label:
                                index == 0
                                    ? 'Final'
                                    : (index == 1)
                                    ? 'Mid'
                                    : 'Quiz',
                          ),
                        ),
                      ),
                    ),
                    const Gap(75),
                    ButtonComponent(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: AppStyles.styleRegular22().copyWith(
                          color: Colors.white,
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
