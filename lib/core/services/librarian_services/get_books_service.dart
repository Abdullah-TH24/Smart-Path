import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/models/librarian_model/book_model.dart';

class GetBooksService {
  String url = 'http://192.168.0.117:8000/api/showBooks';
  Future<List<BookModel>> fetchBooks() async {
    final response = await Api().get(url: url, withToken: true);

    if (response['status'] == true && response['data'] != null) {
      return (response['data'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();
    } else {
      throw Exception('API returned no data');
    }
  }
}
