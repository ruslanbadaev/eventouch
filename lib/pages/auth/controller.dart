import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../controllers/network_controller.dart';
import '../../mixins/valiadation.dart';
import '../../models/response.dart';
import '../../models/user.dart';
import '../../utils/app_dialog.dart';

enum AuthScreenType { signIn, signUp, welcome, emailVerification, success }

class AuthScreenController extends GetxController with Validation {
  bool _isAuthScreen = false;
  UserModel? _selectedUser;
  AuthScreenType _authType = AuthScreenType.welcome;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool get isAuthScreen => _isAuthScreen;
  UserModel? get selectedUser => _selectedUser;
  AuthScreenType get authType => _authType;

  void setAuthScreenType(AuthScreenType type) {
    _authType = type;
    update();
  }

  bool _isLoading = false;
  UserModel? user;

  bool get isLoading => _isLoading;

  Future<void> register() async {
    try {
      _isLoading = true;
      update();
      ResponseModel<UserModel> result = await NetworkController().register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (result.response != null) {
        user = result.response!;
      } else if (result.error?.messages?.first != null) {
        throw result.error?.messages?.first;
      } else if (result.error == null) {
        throw 'UNKNOWN_ERROR';
      } else {
        throw result.error.toString();
      }
      _isLoading = false;
      setAuthScreenType(AuthScreenType.emailVerification);
      update();
    } catch (e) {
      print(e);

      AppDialog.getErrorDialog(
        e.toString(),
      );

      // AppDialog.getErrorDialog(
      //   'Oops! Unknown error. Please try again later.',
      //   details: e.toString(),
      // );
      _isLoading = false;
      update();
    }
  }

  Future<void> login() async {
    try {
      _isLoading = true;
      update();
      ResponseModel<UserModel> result = await NetworkController().login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result.response != null) {
        user = result.response!;
      } else if (result.error?.messages?.first != null) {
        throw result.error?.messages?.first;
      } else if (result.error == null) {
        throw 'UNKNOWN_ERROR';
      } else {
        throw result.error.toString();
      }
      _isLoading = false;
      setAuthScreenType(AuthScreenType.success);
      update();
    } catch (e) {
      print(e);

      AppDialog.getErrorDialog(
        e.toString(),
      );

      _isLoading = false;
      update();
    }
  }
}
