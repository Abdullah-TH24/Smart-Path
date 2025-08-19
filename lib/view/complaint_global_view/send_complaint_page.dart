import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/global/complaints_controller/complaints_cubit.dart';
import 'package:smartpath/core/services/global/complaint_service.dart';
import 'package:smartpath/core/utils/app_colors.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/add_text_field.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class SendComplaintPage extends StatefulWidget {
  const SendComplaintPage({super.key});

  @override
  State<SendComplaintPage> createState() => _SendComplaintPageState();
}

class _SendComplaintPageState extends State<SendComplaintPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _complaintController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  dynamic colors = getColor();

  @override
  void dispose() {
    _complaintController.dispose();
    _categoryController.dispose();
    super.dispose();
    log('complaint controllers disposed');
  }

  Future<Map<String, dynamic>?> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final complaintData = {
        "complaint": _complaintController.text.trim(),
        "category": _categoryController.text.trim(),
      };

      // Optionally clear the form
      _formKey.currentState!.reset();
      return complaintData;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LibrarianWaveAppBar(title: 'lib_grid_6'.tr),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocProvider(
                create: (_) => ComplaintsCubit(ComplaintService()),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customTextField(
                        'title'.tr,
                        _categoryController,
                        maxLines: 2,
                      ),
                      customTextField(
                        'complaint'.tr,
                        _complaintController,
                        maxLines: 8,
                      ),
                      const Gap(20),
                      BlocConsumer<ComplaintsCubit, ComplaintsState>(
                        listener: (context, state) {
                          if (state is ComplaintsError) {
                            showSnackbar('error', state.message);
                          }
                          if (state is ComplaintSended) {
                            showSnackbar(
                              'success',
                              'complaint_added_success'.tr,
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(40),
                              backgroundColor: getColor().buttonText,
                            ),
                            onPressed: () {
                              _submitForm().then((complaintData) {
                                if (complaintData != null) {
                                  BlocProvider.of<ComplaintsCubit>(
                                    context,
                                  ).sendComplaint(complaintData);
                                }
                              });
                            },
                            child: state is ComplaintsLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text('submit_complaint'.tr),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
