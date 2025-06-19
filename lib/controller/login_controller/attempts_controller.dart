import 'package:get/get.dart';

class Attempts extends GetxController {
  int attempts = 4;

  void decrement() {
    attempts--;
    update();
  }
}
