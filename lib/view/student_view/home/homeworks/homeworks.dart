import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/localization/subjects_translate.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';
import 'package:smartpath/widgets/student/home/grades/drop_field_component.dart';

class Homeworks extends StatelessWidget {
  Homeworks({super.key});

  GlobalKey<FormState> homeworkKey = GlobalKey<FormState>();
  TextEditingController subject = TextEditingController();
  TextEditingController operation = TextEditingController();

  List<String> subjects = [
    'history',
    'biology',
    'computer',
    'math',
    'chemistry',
    'physics',
  ];
  List<String> operations = ['Upload', 'Download'];

  @override
  Widget build(BuildContext context) {
    operation.text = 'Download';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarComponent(data: 'grid_item_name_2'.tr),
          SliverToBoxAdapter(
            child: Form(
              key: homeworkKey,
              child: Column(
                children: [
                  const Gap(75),
                  // Select Subject
                  DropFieldComponent(
                    title: 'Select a subject',
                    menuHeight: 175,
                    controller: subject,
                    dropdownMenuEntries: List.generate(
                      6,
                      (index) => DropdownMenuEntry(
                        value: 'Math',
                        label: SubjectTranslator.translate(subjects[index]),
                      ),
                    ),
                  ),
                  const Gap(25),
                  // Select Subject
                  DropFieldComponent(
                    title: 'Select a operation',
                    menuHeight: 175,
                    controller: operation,
                    dropdownMenuEntries: List.generate(
                      2,
                      (index) => DropdownMenuEntry(
                        value: operations[index],
                        label: operations[index],
                      ),
                    ),
                  ),
                  const Gap(50),
                  // Download
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12.5),
                      ),
                    ),
                    child: Text(operation.text),
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
