import 'package:get/get.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';
import 'package:smartpath/view/librarian_view/librarian_add_book_page_view.dart';
import 'package:smartpath/view/librarian_view/librarian_available_books_view.dart';
import 'package:smartpath/view/librarian_view/librarian_books_page.dart';
import 'package:smartpath/view/librarian_view/librarian_borrow_accepted_requests.dart';
import 'package:smartpath/view/librarian_view/librarian_borrow_pending_requests.dart';
import 'package:smartpath/view/librarian_view/librarian_borrow_rejected_requests.dart';
import 'package:smartpath/view/librarian_view/librarian_borrowed_books_managment_page.dart';
import 'package:smartpath/view/complaint_global_view/send_complaint_page.dart';
import 'package:smartpath/view/librarian_view/librarian_home_page.dart';
import 'package:smartpath/view/librarian_view/librarian_main_home_page.dart';
import 'package:smartpath/view/librarian_view/librarian_setting_page.dart';
import 'package:smartpath/view/librarian_view/librarian_update_book_page.dart';
import 'package:smartpath/view/complaint_global_view/user_complaints_page.dart';

class LibrarianRoutes {
  static const String home = '/librarian/home';
  static const String mainHome = '/librarian/main_home';
  //
  static const String addBook = '/librarian/add_book';
  static const String availableBooks = '/librarian/available_books';
  static const String books = '/librarian/books';
  static const String updateBook = '/librarian/update_book';
  //
  static const String borrowRequests = '/librarian/borrow_requests';
  static const String borrowAcceptedRequests =
      '/librarian/borrow_accepted_requests';
  static const String borrowRejectedRequests =
      '/librarian/borrow_rejected_requests';
  static const String borrowedBooksManagement =
      '/librarian/borrowed_books_management';
  //
  static const String complaints = '/librarian/complaints';
  static const String userComplaints = '/librarian/user_complaints';
  static const String settings = '/librarian/settings';

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianHomePage(),
    ),
    GetPage(
      name: mainHome,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianMainHomePage(),
    ),
    GetPage(
      name: addBook,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianAddBookPage(),
    ),
    GetPage(
      name: availableBooks,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianAvailableBooksPage(),
    ),
    GetPage(
      name: LibrarianRoutes.updateBook,
      transition: Transition.cupertinoDialog,
      page: () {
        final book = Get.arguments as BookModel;
        return LibrarianUpdateBookPage(book: book);
      },
    ),
    GetPage(
      name: books,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianBooksPage(),
    ),
    GetPage(
      name: borrowRequests,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianBorrowPendingRequests(),
    ),
    GetPage(
      name: borrowAcceptedRequests,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianBorrowAcceptedRequests(),
    ),
    GetPage(
      name: borrowRejectedRequests,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianBorrowRejectedRequests(),
    ),
    GetPage(
      name: borrowedBooksManagement,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianBorrowedBooksManagmentPage(),
    ),
    GetPage(
      name: complaints,
      transition: Transition.cupertinoDialog,
      page: () => const SendComplaintPage(),
    ),
    GetPage(
      name: userComplaints,
      transition: Transition.cupertinoDialog,
      page: () => const UserComplaintsPage(),
    ),
    GetPage(
      name: settings,
      transition: Transition.cupertinoDialog,
      page: () => const LibrarianSettingPage(),
    ),
  ];
}
