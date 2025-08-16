import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';

class ComplaintService {
  Future sendComplaint(Map<String, dynamic> data) async {
    final response = await Api().post(
      url: AppLinks.sendComplaint,
      body: data,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened while sending your complaint..!');
    }
  }
}
