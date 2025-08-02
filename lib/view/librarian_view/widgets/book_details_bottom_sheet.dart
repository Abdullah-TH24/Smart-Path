import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/widgets/book_card.dart';

class BookDetailsBottomSheet extends StatelessWidget {
  const BookDetailsBottomSheet({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                onPressed: () {
                  Get.back();
                },
                child: Text('ok'.tr),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                onPressed: () {
                  //todo: implement edit book
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
                            onPressed: () {
                              Get.back();
                              Get.back();
                              //BlocProvider.of<BooksCubit>(context).deleteBook(book);
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
    );
  }
}
