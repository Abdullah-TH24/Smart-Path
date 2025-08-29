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

  String severity = "low"; // default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add_medical_file".tr)),
      body: BlocProvider(
        create: (context) => MedicalFileCubit(MedicalFilesServices()),
        child: BlocConsumer<MedicalFileCubit, MedicalFileState>(
          listener: (context, state) {
            if (state is MedicalFileSuccess) {
              showSnackbar('success', "Medical file added successfully".tr);
              Navigator.pop(context);
            }
            if (state is MedicalFileError) {
              showSnackbar('error', state.message);
            }
          },
          builder: (context, state) {
            if (state is MedicalFileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    customTextField("Student ID", studentIdController),
                    customTextField("Nurse ID", nurseIdController),
                    customTextField("Record Date", recordDateController),
                    customTextField("Record Type", recordTypeController),
                    customTextField("Description", descriptionController),
                    customTextField("Treatment", treatmentController),
                    customTextField("Notes", notesController),
                    customTextField("Follow Up", followUpController),
                    customTextField("Follow Up Date", followUpDateController),

                    Text(
                      "Severity".tr,
                      style: AppStyles.styleBold16(),
                    ).paddingSymmetric(horizontal: 16, vertical: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ["low", "medium", "high", "extreme"]
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
                          context.read<MedicalFileCubit>().addMedicalFile({
                            "student_id": studentIdController.text,
                            "nurse_id": nurseIdController.text,
                            "record_date": recordDateController.text,
                            "record_type": recordTypeController.text,
                            "description": descriptionController.text,
                            "treatment": treatmentController.text,
                            "notes": notesController.text,
                            "follow_up": true,
                            "follow_up_date": followUpDateController.text,
                            "severity": severity,
                          });
                        }
                      },
                      child: Text("save".tr),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
