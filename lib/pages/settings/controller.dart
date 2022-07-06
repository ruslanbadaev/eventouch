import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pres7t/models/user.dart';

class SettingsController extends GetxController {
  RxBool _isDarkTheme = false.obs;
  UserModel? _currentUser;

  bool get isDarkTheme => this._isDarkTheme.value;
  UserModel? get currentUser => _currentUser;

  @override
  void onReady() {
    print('onReady');
    super.onReady();
    getThemeMode();
    getCurrentUser();
  }

  void getThemeMode() async {
    _isDarkTheme.value = AdaptiveThemeMode.dark == await AdaptiveTheme.getThemeMode();
    update();
  }

  void toggleThemeMode(BuildContext context) {
    _isDarkTheme.value ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
    getThemeMode();
  }

  Future<void> getCurrentUser() async {
    _currentUser = await UserModel.getCurrentUser();
    update();
  }
}
