import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SettingsController extends GetxController {
  bool _isDarkTheme = false;

  bool get isDarkTheme => this._isDarkTheme;

  @override
  void onReady() {
    print('onReady');
    super.onReady();
    getThemeMode();
  }

  void getThemeMode() async {
    _isDarkTheme = AdaptiveThemeMode.dark == await AdaptiveTheme.getThemeMode();
    update();
  }

  void toggleThemeMode(BuildContext context) {
    _isDarkTheme ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
    getThemeMode();
  }
}
