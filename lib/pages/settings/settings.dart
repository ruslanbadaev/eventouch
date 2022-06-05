import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pres7t/pages/settings/languages.dart';
import 'package:pres7t/widgets/editible_field.dart';

import '../../controllers/session_controller.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreensState createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreen> with TickerProviderStateMixin {
  final SessionController sessionController = Get.find();

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  onTap: (() => controller.toggleThemeMode(context)),
                  title: Text(
                    'App Theme',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                  ),
                  trailing: Icon(
                    controller.isDarkTheme ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: AdaptiveTheme.of(context).theme.iconTheme.color,
                  ),
                ),
                ListTile(
                  onTap: (() => Get.to(() => LanguagesScreen())),
                  title: Text(
                    'Language',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'English',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText2,
                  ),
                  trailing: Icon(
                    Icons.language_rounded,
                    color: AdaptiveTheme.of(context).theme.iconTheme.color,
                  ),
                ),
                EditebleField(
                  title: 'Email:',
                  subtitle: 'r.badaeff@gmail.com',
                ),
                ListTile(
                  onTap: () => {
                    Get.back(),
                    sessionController.logout(),
                  },
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.ORANGE,
                          fontSize: 24,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
