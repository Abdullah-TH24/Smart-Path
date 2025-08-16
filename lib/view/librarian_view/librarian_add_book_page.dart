// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/controller/library_controller/books_cubits/bar_code_cubit.dart';
import 'package:smartpath/controller/library_controller/books_cubits/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
import 'package:smartpath/view/librarian_view/widgets/add_text_field.dart';
import 'package:smartpath/view/librarian_view/widgets/book_bar_code_scan.dart';
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

  Future _submitForm() async {
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

      // Optionally clear the form
      _formKey.currentState!.reset();
      return bookData;
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
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => BarcodeCubit()),
                  BlocProvider(create: (_) => BooksCubit(BooksService())),
                ],
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
                        child: librarianCustomTextField(
                          'serial_number'.tr,
                          _serialNumberController,
                          scan: const BookBarCodeScan(),
                        ),
                      ),
                      librarianCustomTextField('title'.tr, _titleController),
                      librarianCustomTextField('author'.tr, _authorController),
                      librarianCustomTextField(
                        'category'.tr,
                        _categoryController,
                      ),
                      librarianCustomTextField(
                        'publisher'.tr,
                        _publisherController,
                      ),
                      librarianCustomTextField(
                        'shelf_location'.tr,
                        _shelfLocationController,
                      ),
                      librarianCustomTextField(
                        'description'.tr,
                        _descriptionController,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<BooksCubit, BooksState>(
                        listener: (context, state) {
                          if (state is BooksError) {
                            showSnackbar('error', state.message);
                          }
                          if (state is BookAdded) {
                            showSnackbar('success', 'add_book_success'.tr);
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size.fromHeight(40),
                              backgroundColor: Colors.brown,
                            ),
                            onPressed: () {
                              _submitForm().then((bookData) {
                                if (bookData != null) {
                                  BlocProvider.of<BooksCubit>(
                                    context,
                                  ).addBook(bookData);
                                }
                              });
                            },
                            child: state is BooksLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(199, 231, 218, 205),
                                    ),
                                  )
                                : Text('submit'.tr),
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
