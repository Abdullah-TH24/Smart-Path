part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookModel> books;

  BooksLoaded(this.books);
}

class BookAdded extends BooksState {}

class BookUpdated extends BooksState {}

class BookDeleted extends BooksState {}

class BooksError extends BooksState {
  final String message;

  BooksError(this.message);
}
