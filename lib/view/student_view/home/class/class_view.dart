import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home/class/class_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/widgets/student/home/calendar/app_bar_component.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ClassController>(
        init: ClassController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(child: SpinKitSpinningLines(color: Colors.indigo))
              : controller.errorMessage != null
              ? Center(child: Image.asset(AppAssets.noInternet))
              : CustomScrollView(
                slivers: [
                  const AppBarComponent(data: 'Class'),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Teachers',
                            style: AppStyles.styleBold16(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(
                          controller.teachers!.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 6,
                            ),
                            height: 90,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Teacher Info
                                Positioned.fill(
                                  left: 40,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[100],
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.teachers![index].user?.name![0].toUpperCase()}${controller.teachers![index].user?.name!.substring(1)} ${controller.teachers![index].user?.middleName![0].toUpperCase()}${controller.teachers![index].user?.lastName![0].toUpperCase()}',
                                              style: AppStyles.styleBold16(),
                                            ),
                                            Text(
                                              '${controller.teachers![index].subject![0].toUpperCase()}${controller.teachers![index].subject!.substring(1)}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Teacher Number
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
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Students',
                            style: AppStyles.styleBold16(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(
                          controller.students!.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 6,
                            ),
                            height: 90,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Student Info
                                Positioned.fill(
                                  left: 40,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[100],
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.students![index].user!.name![0].toUpperCase()}${controller.students![index].user!.name!.substring(1)} ${controller.students![index].user!.middleName![0].toUpperCase()}${controller.students![index].user!.lastName![0].toUpperCase()}',
                                              style: AppStyles.styleBold16(),
                                            ),
                                            Text(
                                              '${controller.students![index].user!.phoneNumber}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Student Number
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
                      ],
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
