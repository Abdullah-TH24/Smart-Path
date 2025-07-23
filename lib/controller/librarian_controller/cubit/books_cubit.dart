// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartpath/core/services/librarian_services/get_books_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final GetBooksService booksService;

  BooksCubit(this.booksService) : super(BooksInitial());

  Future<void> fetchBooks() async {
    try {
      emit(BooksLoading());
      final books = await booksService.fetchBooks();
      log(books[0].title);
      emit(BooksLoaded(books));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}
