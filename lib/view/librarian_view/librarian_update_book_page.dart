import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/librarian_controller/books_cubits/bar_code_cubit.dart';
import 'package:smartpath/controller/librarian_controller/books_cubits/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/librarian_view/widgets/add_text_field.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_bar_code_scan.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianUpdateBookPage extends StatefulWidget {
  const LibrarianUpdateBookPage({super.key, required this.book});
  final BookModel book;

  @override
  State<LibrarianUpdateBookPage> createState() =>
      _LibrarianUpdateBookPageState();
}

class _LibrarianUpdateBookPageState extends State<LibrarianUpdateBookPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _authorController;
  late final TextEditingController _categoryController;
  late final TextEditingController _publisherController;
  late final TextEditingController _serialNumberController;
  late final TextEditingController _shelfLocationController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book.title);
    _authorController = TextEditingController(text: widget.book.author);
    _categoryController = TextEditingController(text: widget.book.category);
    _publisherController = TextEditingController(text: widget.book.publisher);
    _serialNumberController = TextEditingController(
      text: widget.book.serialNumber,
    );
    _shelfLocationController = TextEditingController(
      text: widget.book.shelfLocation,
    );
    _descriptionController = TextEditingController(
      text: widget.book.description,
    );
  }

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
      _formKey.currentState!.reset();
      return bookData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          LibrarianWaveAppBar(title: 'update_book'.tr),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => BarcodeCubitAdd()),
                  BlocProvider(create: (_) => BooksCubit(BooksService())),
                ],
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BlocListener<BarcodeCubitAdd, String?>(
                        listener: barCodeCubitListener,
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
                      BlocConsumer<BooksCubit, BooksState>(
                        listener: updateBookCubitListener,
                        builder: updateBookCubitButtonBuilder,
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

  Widget updateBookCubitButtonBuilder(context, state) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(40),
        backgroundColor: Colors.brown,
      ),
      onPressed: () {
        _submitForm().then((bookData) {
          if (bookData != null && mounted) {
            BlocProvider.of<BooksCubit>(
              context,
            ).updateBook(bookData, widget.book.bookId);
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
          : Text('update_book'.tr),
    );
  }

  void updateBookCubitListener(context, state) {
    if (state is BooksError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
    if (state is BookUpdated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Durations.extralong4,
          content: Text('update_book_success'.tr),
        ),
      );
      Future.delayed(Durations.extralong4, () {
        Get.back();
        Get.toNamed(LibrarianRoutes.books);
      });
    }
  }

  void barCodeCubitListener(context, barcode) {
    if (barcode != null) {
      _serialNumberController.text = barcode;
    }
  }
}
