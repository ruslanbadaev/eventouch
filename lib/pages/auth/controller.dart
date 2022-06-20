import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pres7t/mixins/valiadation.dart';

import '../../models/user.dart';

enum AuthScreenType { signIn, signUp, welcome, emailVerification }

class AuthScreenController extends GetxController with Validation {
  bool _isAuthScreen = false;
  UserModel? _selectedUser;
  AuthScreenType _authType = AuthScreenType.welcome;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get isAuthScreen => _isAuthScreen;
  UserModel? get selectedUser => _selectedUser;
  AuthScreenType get authType => _authType;

  void setAuthScreenType(AuthScreenType type) {
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
