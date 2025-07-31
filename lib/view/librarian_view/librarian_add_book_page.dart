// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/controller/librarian_controller/cubit/bar_code_cubit.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_bar_code_scan.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianAddBookPage extends StatefulWidget {
  const LibrarianAddBookPage({super.key});

  @override
  State<LibrarianAddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<LibrarianAddBookPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _shelfLocationController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _categoryController.dispose();
    _publisherController.dispose();
    _serialNumberController.dispose();
    _shelfLocationController.dispose();
    _descriptionController.dispose();
    super.dispose();
    log('controllers disposed');
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final bookData = {
        "title": _titleController.text.trim(),
        "author": _authorController.text.trim(),
        "category": _categoryController.text.trim(),
        "publisher": _publisherController.text.trim(),
        "serrial_number": _serialNumberController.text.trim(),
        "shelf_location": _shelfLocationController.text.trim(),
        "description": _descriptionController.text.trim(),
      };
      dynamic data = await Api().post(
        url: AppLinks.addBook,
        body: bookData,
        withToken: true,
      );
      log(data.toString());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('add_book_success'.tr)));

      // Optionally clear the form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LibrarianWaveAppBar(title: 'add_book'.tr),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocProvider(
                create: (_) => BarcodeCubit(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BlocListener<BarcodeCubit, String?>(
                        listener: (context, barcode) {
                          if (barcode != null) {
                            _serialNumberController.text = barcode;
                          }
                        },
                        child: addBookTextField(
                          'serial_number'.tr,
                          _serialNumberController,
                          scan: LibrarianBarCodeScan(),
                        ),
                      ),
                      addBookTextField('title'.tr, _titleController),
                      addBookTextField('author'.tr, _authorController),
                      addBookTextField('category'.tr, _categoryController),
                      addBookTextField('publisher'.tr, _publisherController),
                      addBookTextField(
                        'shelf_location'.tr,
                        _shelfLocationController,
                      ),
                      addBookTextField(
                        'description'.tr,
                        _descriptionController,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        onPressed: _submitForm,
                        child: Text('submit Book'.tr),
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

  Widget addBookTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    Widget? scan,
  }) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.brown),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: const Color.fromARGB(199, 231, 218, 205),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? '${'required_field'.tr} : $label'
                  : null,
            ),
          ),
        ),
        scan == null ? const Gap(0) : const Gap(16),
        ?scan,
      ],
    );
  }
}
