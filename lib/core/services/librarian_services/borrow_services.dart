import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/librarian_model/borrow_model.dart';

class BorrowServices {
  Future<List<BorrowModel>> fetchBorrowsOrders() async {
    final response = await Api().get(
      url: AppLinks.getBorrowOrders,
      withToken: true,
    );
    if (response['status'] == true && response['message'] != null) {
      return (response['message'] as List)
          .map((item) => BorrowModel.fromJson(item))
          .toList();
    } else {
      throw Exception('No data returned from borow orders');
    }
  }

  Future<void> borrowBook(String serialnum) async {
    final response = await Api().post(
      url: AppLinks.borrowBook,
      body: {'serrial_number': serialnum},
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    }
    if (response['status'] == false) {
      throw Exception(response['message']);
    }
    {}
  }

  //modify borrow here :
  Future<void> modifyBorrow(Map<String, dynamic> modifyInfo) async {
    final response = await Api().post(
      url: AppLinks.modifyBorrow,
      body: modifyInfo,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception(
        'Error happened when editing the borrow..! ${response['errors']}',
      );
    }
  }
}
