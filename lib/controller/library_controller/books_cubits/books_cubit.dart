// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartpath/core/services/librarian_services/books_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksService _booksService;

  BooksCubit(this._booksService) : super(BooksInitial());

  Future<void> fetchBooks() async {
    try {
      emit(BooksLoading());
      final books = await _booksService.fetchBooks();
      if (books.isEmpty) {
        emit(BooksEmpty());
        return;
      }
      emit(BooksLoaded(books));
    } catch (e) {
      log(e.toString());
      emit(BooksError(e.toString()));
    }
  }

  Future<void> fetchAvailableBooks() async {
    try {
      emit(BooksLoading());
      final books = await _booksService.fetchBooks();
      final availableBooks = books.where((book) {
        return !(book.bookStatus.contains("borrowed"));
      }).toList();

      log("Available books count: ${availableBooks.length}");
      emit(BooksLoaded(availableBooks));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future<void> addBook(Map<String, dynamic> bookdata) async {
    try {
      emit(BooksLoading());
      await _booksService.addBook(bookdata);
      emit(BookAdded());
    } catch (e) {
      log(e.toString());
      emit(BooksError(e.toString()));
    }
  }

  Future<void> updateBook(Map<String, dynamic> bookdata, num id) async {
    try {
      emit(BooksLoading());
      await _booksService.updateBook(bookdata, id);
      emit(BookUpdated());
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future<void> deleteBook(num id) async {
    try {
      emit(BooksLoading());
      await _booksService.deleteBook(id);
      emit(BookDeleted());
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}
