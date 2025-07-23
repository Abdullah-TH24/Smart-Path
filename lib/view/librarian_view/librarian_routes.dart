import 'package:get/get.dart';
import 'package:smartpath/view/librarian_view/librarian_add_book_page.dart';
import 'package:smartpath/view/librarian_view/librarian_available_books_page.dart';
import 'package:smartpath/view/librarian_view/librarian_books_page.dart';
import 'package:smartpath/view/librarian_view/librarian_borrowed_books_managment_page.dart';
import 'package:smartpath/view/librarian_view/librarian_home_page.dart';
import 'package:smartpath/view/librarian_view/librarian_main_home_page.dart';

class LibrarianRoutes {
  static const String addBook = '/librarian/add_book';
  static const String availableBooks = '/librarian/available_books';
  static const String books = '/librarian/books';
  static const String borrowedBooksManagement =
      '/librarian/borrowed_books_management';
  static const String home = '/librarian/home';
  static const String mainHome = '/librarian/main_home';

  static final List<GetPage> routes = [
    GetPage(name: addBook, page: () => const LibrarianAddBookPage()),
    GetPage(
      name: availableBooks,
      page: () => const LibrarianAvailableBooksPage(),
    ),
    GetPage(name: books, page: () => const LibrarianBooksPage()),
    GetPage(
      name: borrowedBooksManagement,
      page: () => const LibrarianBorrowedBooksManagmentPage(),
    ),
    GetPage(name: home, page: () => LibrarianHomePage()),
    GetPage(name: mainHome, page: () => const LibrarianMainHomePage()),
  ];
}
