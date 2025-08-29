import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CurrentPageController extends GetxController {
  List<int> currentPages = [];
  int length;
  CurrentPageController({required this.length});

  @override
  onInit() {
    buildCurrent();
    super.onInit();
  }

  buildCurrent() {
    currentPages = List.generate(length, (_) => 1);
  }

  void setCurrentPage(int postIndex, int pageIndex) {
    currentPages[postIndex] = pageIndex;
    update();
  }
}
