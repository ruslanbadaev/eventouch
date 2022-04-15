import 'package:get/get.dart';

class SessionController extends GetxController {
  bool? _isAuth;

  bool? get isAuth => _isAuth;

  void checkAuth() {
    Future.delayed(Duration(seconds: 2), () {
      _isAuth = false;
      update();
    });
  }

  void login() {
    _isAuth = true;
    update();
  }

  void logout() {
    _isAuth = false;
    update();
  }
}
