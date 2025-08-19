import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/utils.dart';
import 'package:smartpath/controller/library_controller/books_cubits/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/view/librarian_view/utils/show_snackbar.dart';
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
        create: (context) => BooksCubit(BooksService())..fetchBooks(),
        child: CustomScrollView(
          slivers: [
            LibrarianWaveAppBar(title: 'books'.tr),
            BlocConsumer<BooksCubit, BooksState>(
              listener: (context, state) {
                if (state is BooksError) {
                  showSnackbar('error', state.message);
                }
                if (state is BooksLoaded) {
                  if (state.books.isEmpty) {
                    showSnackbar('info', 'no books');
                  }
                }
                if (state is BookDeleted) {
                  showSnackbar('success', 'Book deleted successfully');
                }
              },
              builder: (context, state) {
                if (state is BooksLoading) {
                  return const SliverLoadingIndicator();
                } else if (state is BooksLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final book = state.books[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GestureDetector(
                          onTap: () {
                            //show book details in bottom sheet with ok button and edit button on the bottom
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return BookDetailsBottomSheet(
                                  book: book,
                                  booksCubit: context.read<BooksCubit>(),
                                );
                              },
                            );
                          },
                          child: BookCard(book: book),
                        ),
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
