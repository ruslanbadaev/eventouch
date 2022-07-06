import 'package:get/state_manager.dart';

import 'models/user.dart';

class AppController extends GetxController {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  var tabIndex = 0;

  void changeTabIndex(int? index) {
    tabIndex = index ?? 0;
    update();
  }

  Future<void> getCurrentUser() async {
    _currentUser = await UserModel.getCurrentUser();
    update();
  }
}
