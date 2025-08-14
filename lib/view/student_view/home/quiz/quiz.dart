import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionIndex = 0;

  final questions = [
    'How many planets are there in the Milky Way galaxy?',
    'What color your blood',
    'What color the sky at to night',
  ];
  final answers = {
    0: ['8', '4', '3', 'Non of above'],
    1: ['red', 'black', 'green', 'Non of above'],
    2: ['black', 'white', 'blue', 'Non of above'],
  };
  Map checkIndex = {
    0: [false, false, false, false],
    1: [false, false, false, false],
    2: [false, false, false, false],
  };
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarComponent(data: 'Quiz'),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: Get.height - 120,
              width: Get.width,
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Container(
                      key: ValueKey<int>(questionIndex),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(75),
                          // Number of Questions
                          Text(
                            'Question ${questionIndex + 1} out of 3',
                            style: AppStyles.styleRegular12(),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(12.5),
                          // Questions Content
                          Text(
                            questions[questionIndex],
                            style: AppStyles.styleMedium20(),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(50),
                          // Answers
                          ...List.generate(
                            answers[questionIndex]!.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(top: 12.5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      12.5,
                                    ),
                                    side: const BorderSide(
                                      color: Colors.indigo,
                                      width: 1,
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  checked = true;
                                  for (var i = 0; i < 4; i++) {
                                    checkIndex[questionIndex][i] = false;
                                  }
                                  checkIndex[questionIndex][index] = true;
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width: Get.width - 40,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          answers[questionIndex]![index],
                                          style: AppStyles.styleMedium20(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      if (checked &&
                                          checkIndex[questionIndex][index])
                                        Positioned(
                                          right: 5,
                                          top: 1,
                                          bottom: 1,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
                                              color: Colors.indigo[50],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(50),
                        ],
                      ),
                    ),
                  ),
                  // Previous And Next
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // (<) icon
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            right: BorderSide(color: Colors.indigo, width: 2),
                            left: BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (questionIndex > 0) {
                                questionIndex = questionIndex - 1;
                              }
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.indigo[900],
                          ),
                        ),
                      ),
                      // (>) Icon
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            right: BorderSide(color: Colors.indigo, width: 2),
                            left: BorderSide(color: Colors.indigo, width: 2),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (questionIndex < 2) {
                                questionIndex = questionIndex + 1;
                              }
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.indigo[900],
                          ),
                        ),
                      ),
                    ],
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
