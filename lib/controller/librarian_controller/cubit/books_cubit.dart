// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartpath/core/services/librarian_services/get_books_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksService booksService;

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

  Future addBook(Map<String, dynamic> bookdata) async {
    try {
      emit(BooksLoading());
      await booksService.addBook(bookdata);
      emit(BookAdded());
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future updateBook(Map<String, dynamic> bookdata, num id) async {
    try {
      emit(BooksLoading());
      await booksService.updateBook(bookdata, id);
      emit(BookUpdated());
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future deleteBook(num id) async {
    try {
      emit(BooksLoading());
      await booksService.deleteBook(id);
      emit(BookDeleted());
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}
