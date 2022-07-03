import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SettingsController extends GetxController {
  RxBool _isDarkTheme = false.obs;

  bool get isDarkTheme => this._isDarkTheme.value;

  @override
  void onReady() {
    print('onReady');
    super.onReady();
    getThemeMode();
  }

  void getThemeMode() async {
    _isDarkTheme.value = AdaptiveThemeMode.dark == await AdaptiveTheme.getThemeMode();
    update();
  }

  void toggleThemeMode(BuildContext context) {
    AdaptiveTheme.of(context).toggleThemeMode();
    // _isDarkTheme.value ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
    getThemeMode();
  }
}
