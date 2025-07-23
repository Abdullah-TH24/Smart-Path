import 'package:http/http.dart' as http;
import 'package:smartpath/core/utils/app_links.dart';

class AuthServices {
  Future<bool?> createOrUpdatePinCode(
    String token,
    String pinCode,
    String confirmedPinCode,
  ) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.createOrUpdatePinCode),
        body: {"pinCode": pinCode, "confirmedPinCode": confirmedPinCode},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> checkPinCode(String token, String pinCode) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(AppLinks.checkPinCode),
        body: {"pinCode": pinCode},
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> deletePinCode(String token) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse(AppLinks.deletePinCode),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }
}
