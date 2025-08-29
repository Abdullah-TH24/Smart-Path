import 'package:get/get.dart';

class MarkButton extends GetxController {
  int dayIndex = 1;

  @override
  onInit() {
    final DateTime time = DateTime.now();
    switch (time.weekday) {
      case 7:
        dayIndex = 1;
        break;
      case 1:
        dayIndex = 2;
        break;
      case 2:
        dayIndex = 3;
        break;
      case 3:
        dayIndex = 4;
        break;
      case 4:
        dayIndex = 5;
        break;
      default:
        dayIndex = 1;
        break;
    }
    super.onInit();
  }

  makeIndexEqualToValue(int dayIndex) {
    this.dayIndex = dayIndex;
    update();
  }
}
