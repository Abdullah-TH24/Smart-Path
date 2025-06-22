import 'package:get/get.dart';

class MarkButton extends GetxController {
  int index = 1;

  @override
  onInit() {
    final DateTime time = DateTime.now();
    switch (time.weekday) {
      case 7:
        index = 1;
        break;
      case 1:
        index = 2;
        break;
      case 2:
        index = 3;
        break;
      case 3:
        index = 4;
        break;
      case 4:
        index = 5;
        break;
      default:
        index = 1;
        break;
    }
    super.onInit();
  }

  makeIndexEqualToValue(int index) {
    this.index = index;
    update();
  }
}
