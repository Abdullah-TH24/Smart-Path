import 'package:get/get.dart';
import 'package:smartpath/main.dart';

class LockAppController extends GetxController {
  bool enableLookScreen = true;
  bool enableBiometric = false;

  @override
  onInit() {
    prefs!.setBool('lock_screen', true);
    enableBiometric = prefs!.getBool('biometric') ?? false;
    super.onInit();
  }

  lockScreen(bool value) {
    enableLookScreen = value;
    update();
  }

  biometric(bool value) {
    enableBiometric = value;
    update();
  }
}
