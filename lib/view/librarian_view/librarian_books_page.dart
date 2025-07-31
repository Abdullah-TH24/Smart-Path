// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smartpath/controller/librarian_controller/cubit/books_cubit.dart';
import 'package:smartpath/core/services/librarian_services/get_books_service.dart';
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
                  return LibrarianLoadingIndicator();
                } else if (state is BooksLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final book = state.books[index];
                      return ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.author),
                      );
                    }, childCount: state.books.length),
                  );
                } else if (state is BooksError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                }

                return SliverToBoxAdapter(
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

class LibrarianLoadingIndicator extends StatelessWidget {
  const LibrarianLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6, // or double.infinity
        child: Center(child: SpinKitFadingCube(color: Colors.brown[400])),
      ),
    );
  }
}
