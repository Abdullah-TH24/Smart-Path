import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';

class MedicalFilesServices {
  Future<void> addMedicalFile(Map<String, dynamic> medicalData) async {
    final response = await Api().post(
      url: AppLinks.addMedicalFile,
      body: medicalData,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened when sending the medical data..!');
    }
  }
}
