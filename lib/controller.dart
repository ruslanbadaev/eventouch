import 'package:get/state_manager.dart';

class AppController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int? index) {
    tabIndex = index ?? 0;
    update();
  }
}
