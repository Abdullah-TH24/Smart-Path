import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

class GetBooksService {
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
}
