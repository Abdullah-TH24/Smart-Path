import 'package:get/get.dart';

class Holiday extends GetxController {
  bool myHoliday = false;

  isHoliday() {
    myHoliday = true;
    update();
  }

  isNotHoliday() {
    myHoliday = false;
    update();
  }
}
