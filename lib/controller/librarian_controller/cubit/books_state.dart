part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookModel> books;

  BooksLoaded(this.books);
}

class BooksError extends BooksState {
  final String message;

  BooksError(this.message);
}
