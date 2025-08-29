// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/nurse_controller/cubit/medical_file_cubit.dart';
import 'package:smartpath/core/services/nurse_services/medical_files_services.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/core/utils/app_styles.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/add_text_field.dart';
import 'package:smartpath/widgets/student_widget/home_widget/calendar_widget/app_bar_component.dart';

class NurseAddMedicalFilePage extends StatefulWidget {
  const NurseAddMedicalFilePage({super.key});

  @override
  State<NurseAddMedicalFilePage> createState() =>
      _NurseAddMedicalFilePageState();
}

class _NurseAddMedicalFilePageState extends State<NurseAddMedicalFilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController nurseIdController = TextEditingController();
  final TextEditingController recordDateController = TextEditingController();
  final TextEditingController recordTypeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController followUpController = TextEditingController();
  final TextEditingController followUpDateController = TextEditingController();

  String severity = 'low'; // default

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalFileCubit(MedicalFilesServices()),
      child: BlocConsumer<MedicalFileCubit, MedicalFileState>(
        listener: (context, state) {
          if (state is MedicalFileSuccess) {
            showSnackbar('success', 'Medical file added successfully'.tr);
          }
          if (state is MedicalFileError) {
            showSnackbar('error', state.message);
          }
        },
        builder: (context, state) {
          if (state is MedicalFileLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: CustomScrollView(
              slivers: [
                AppBarComponent(
                  data: 'Add Medical File'.tr,
                  enableLeading: false,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          customTextField('Student ID', studentIdController),
                          customTextField('Nurse ID', nurseIdController),
                          customTextField('Record Date', recordDateController),
                          customTextField('Record Type', recordTypeController),
                          customTextField('Follow Up', followUpController),
                          customTextField(
                            'Follow Up Date',
                            followUpDateController,
                          ),
                          customTextField(
                            'Description',
                            descriptionController,
                            maxLines: 2,
                          ),
                          customTextField(
                            'Treatment',
                            treatmentController,
                            maxLines: 2,
                          ),
                          customTextField(
                            'Notes',
                            notesController,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Severity'.tr,
                              style: AppStyles.styleBold16(),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: ['low', 'medium', 'high', 'extreme']
                                .map(
                                  (level) => RadioListTile<String>(
                                    title: Text(level.tr),
                                    value: level,
                                    dense: true,
                                    groupValue: severity,
                                    fillColor: MaterialStateProperty.all(
                                      Colors.cyan[600],
                                    ),
                                    onChanged: (value) {
                                      setState(() => severity = value!);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: getColor().buttonText,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<MedicalFileCubit>()
                                    .addMedicalFile({
                                      'student_id': studentIdController.text,
                                      'nurse_id': nurseIdController.text,
                                      'record_date': recordDateController.text,
                                      'record_type': recordTypeController.text,
                                      'description': descriptionController.text,
                                      'treatment': treatmentController.text,
                                      'notes': notesController.text,
                                      'follow_up': true,
                                      'follow_up_date':
                                          followUpDateController.text,
                                      'severity': severity,
                                    });
                              }
                            },
                            child: Text('save'.tr),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
