import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

class BooksService {
  Future<List<BookModel>> fetchBooks() async {
    final response = await Api().get(url: AppLinks.getBooks, withToken: true);

    if (response['status'] == true && response['data'] != null) {
      return (response['data'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();
    } else {
      throw Exception('API returned no data');
    }
  }

  Future<void> addBook(Map<String, dynamic> bookdata) async {
    final response = await Api().post(
      url: AppLinks.addBook,
      body: bookdata,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened when adding the book..!');
    }
  }

  Future<void> updateBook(Map<String, dynamic> bookdata, num id) async {
    final response = await Api().post(
      url: '${AppLinks.updateBook}$id',
      body: bookdata,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened when updating the book..!');
    }
  }

  Future deleteBook(num id) async {
    final response = await Api().delete(url: '${AppLinks.deleteBook}$id');
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened when deleting the book..!');
    }
  }
}
