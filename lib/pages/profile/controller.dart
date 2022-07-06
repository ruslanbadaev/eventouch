import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../models/user.dart';

class ProfileController extends GetxController {
  UserModel? _currentUser;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  UserModel? get currentUser => _currentUser;

  void getUserData() async {
    _currentUser = await UserModel.getCurrentUser();
    update();
  }
}
