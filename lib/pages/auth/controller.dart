import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../models/user.dart';

enum AuthType { signIn, signUp, welcome }

class AuthController extends GetxController {
  bool _isAuth = false;
  UserModel? _selectedUser;
  AuthType _authType = AuthType.welcome;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isAuth => _isAuth;
  UserModel? get selectedUser => _selectedUser;
  AuthType get authType => _authType;

  void setAuthType(AuthType type) {
    _authType = type;
    update();
  }

  void signIn(Function onSignedIn) async {
    // print(
    //     'response::: ${(await NetworkController.signIn(login: loginController.text, password: passwordController.text)).response}');
    // print(
    //     'error::: ${(await NetworkController.signIn(login: loginController.text, password: passwordController.text)).error}');
    onSignedIn();
    update();
  }
}
