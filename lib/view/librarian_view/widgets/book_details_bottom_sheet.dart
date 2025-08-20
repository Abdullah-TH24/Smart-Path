import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/controller/library_controller/books_cubits/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/utils/librarian_routes.dart';
import 'package:smartpath/view/librarian_view/widgets/book_card.dart';

class BookDetailsBottomSheet extends StatelessWidget {
  const BookDetailsBottomSheet({
    super.key,
    required this.book,
    required this.booksCubit,
  });

  final BookModel book;
  final BooksCubit booksCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(BooksService()),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BookCard(book: book),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('ok'.tr),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    //remove the bottom sheet and the book page so i get back to it if the book updated
                    Get.back();
                    Get.offAndToNamed(
                      LibrarianRoutes.updateBook,
                      arguments: book,
                    );
                  },
                  child: Text('edit'.tr),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('delete'.tr),
                          content: Text('delete_confirm'.tr),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('no'.tr),
                            ),
                            TextButton(
                              onPressed: () async {
                                await booksCubit.deleteBook(book.bookId);
                                Get.back();
                                Get.back();
                                booksCubit.fetchBooks();
                              },
                              child: Text('yes'.tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('delete'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
