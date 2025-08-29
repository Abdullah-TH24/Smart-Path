// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/student_controller/home_controller/attendance_controller/attendance_controller.dart';
import 'package:smartpath/controller/student_controller/home_controller/attendance_controller/upload_justification_controller.dart';
import 'package:smartpath/core/utils/app_assets.dart';
import 'package:smartpath/main.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/widgets/student_widget/home_widget/attendance_widget/info_about_absent_widget.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';
import 'package:file_picker/file_picker.dart';

class Absences extends StatefulWidget {
  const Absences({super.key});

  @override
  State<Absences> createState() => _AbsencesState();
}

class _AbsencesState extends State<Absences> {
  AttendanceController controller = Get.put(AttendanceController());

  File? _pdfFile;
  List<DateTime?> _selectedDate = [
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  ];
  List<DateTime> absentDays = [];
  bool isAbsentNow = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      init: AttendanceController(),
      builder: (controller) {
        if (controller.absentDates != null) {
          absentDays.clear();
          for (var i = 0; i < controller.absentDates!.length; i++) {
            absentDays.add(
              DateTime(
                int.parse(controller.absentDates![i].split('-')[0]),
                int.parse(controller.absentDates![i].split('-')[1]),
                int.parse(controller.absentDates![i].split('-')[2]),
              ),
            );
            if (_selectedDate[0] == absentDays[i]) {
              isAbsentNow = true;
            }
          }
        }
        return Scaffold(
          body: (controller.isLoading!)
              ? const Center(child: SpinKitSpinningLines(color: Colors.indigo))
              : controller.errorMessage != null
              ? Center(child: Image.asset(AppAssets.noInternet))
              : CustomScrollView(
                  slivers: [
                    AppBarComponent(data: 'grid_item_name_5'.tr),
                    // Calender
                    SliverToBoxAdapter(
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          monthBorderRadius: BorderRadius.circular(12.5),
                          yearBorderRadius: BorderRadius.circular(12.5),
                          controlsTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          lastMonthIcon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                            size: 15,
                          ),
                          nextMonthIcon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 15,
                          ),
                          calendarType: CalendarDatePicker2Type.single,
                          selectedDayHighlightColor: Colors.indigo,
                          dayBuilder:
                              ({
                                required date,
                                decoration,
                                isDisabled,
                                isSelected,
                                isToday,
                                textStyle,
                              }) {
                                final bool isAbsent = absentDays.any(
                                  (absentDay) =>
                                      absentDay.year == date.year &&
                                      absentDay.month == date.month &&
                                      absentDay.day == date.day,
                                );
                                return Container(
                                  decoration: BoxDecoration(
                                    color: isSelected!
                                        ? Colors.indigo
                                        : isAbsent
                                        ? Colors.red
                                        : isToday!
                                        ? Colors.indigo[100]
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      color: (isSelected || isAbsent)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: isAbsent
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                );
                              },
                        ),
                        value: _selectedDate,
                        onValueChanged: (dates) {
                          for (var i = 0; i < absentDays.length; i++) {
                            if (dates[0] == absentDays[i]) {
                              isAbsentNow = true;
                              break;
                            } else {
                              isAbsentNow = false;
                            }
                          }
                          _selectedDate = dates;
                          setState(() {});
                        },
                      ),
                    ),
                    // Absent & Present Numbers
                    InfoAboutAbsent(controller: controller),
                    // <Upload Justification> Button
                    SliverToBoxAdapter(
                      child: GetBuilder<UploadJustificationController>(
                        init: UploadJustificationController(),
                        builder: (uploadPdf) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: !isAbsentNow
                                    ? null
                                    : () async {
                                        final result = await FilePicker.platform
                                            .pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: ['pdf'],
                                            );
                                        if (result != null) {
                                          setState(() {
                                            _pdfFile = File(
                                              result.files.single.path!,
                                            );
                                          });
                                          await uploadPdf.uploadJustification(
                                            prefs!.getString('token')!,
                                            _pdfFile!,
                                          );
                                          if (uploadPdf.errorMessage != null) {
                                            showSnackbar(
                                              'Error'.tr,
                                              uploadPdf.errorMessage!,
                                            );
                                          } else if (uploadPdf.result!) {
                                            showSnackbar(
                                              'Success'.tr,
                                              'Justification has been Uploaded successfully',
                                            );
                                          }
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      12.5,
                                    ),
                                  ),
                                ),
                                child: Text('Raise justification'.tr),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
