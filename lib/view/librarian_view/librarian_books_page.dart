import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/utils.dart';
import 'package:smartpath/controller/librarian_controller/cubit/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/get_books_service.dart';
import 'package:smartpath/view/librarian_view/widgets/book_card.dart';
import 'package:smartpath/view/librarian_view/widgets/book_details_bottom_sheet.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_loading_indicator.dart';
import 'package:smartpath/view/librarian_view/widgets/librarian_wave_app_bar.dart';

class LibrarianBooksPage extends StatelessWidget {
  const LibrarianBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        //get the book on the moment the cubit created
        create: (context) => BooksCubit(GetBooksService())..fetchBooks(),
        child: CustomScrollView(
          slivers: [
            LibrarianWaveAppBar(title: 'books'.tr),
            BlocConsumer<BooksCubit, BooksState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is BooksLoading) {
                  return const LibrarianLoadingIndicator();
                } else if (state is BooksLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final book = state.books[index];
                      return GestureDetector(
                        onTap: () {
                          //show book details in bottom sheet with ok button and edit button on the bottom
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BookDetailsBottomSheet(book: book);
                            },
                          );
                        },
                        child: BookCard(book: book),
                      );
                    }, childCount: state.books.length),
                  );
                } else if (state is BooksError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(child: Text('No state yet.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
