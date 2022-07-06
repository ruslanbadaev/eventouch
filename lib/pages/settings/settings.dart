import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../utils/app_dialog.dart';
import '../../utils/constants/colors.dart';
import '../../widgets/editible_field.dart';
import '../auth/auth.dart';
import 'controller.dart';
import 'languages.dart';

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
                  onTap: () async {
                    controller.currentUser == null
                        ? Get.to(AuthScreen(
                            onClose: () => controller.getCurrentUser(),
                          ))
                        : AppDialog.getSelectDialog(
                            text: 'Logout?',
                            onSuccess: () => {
                              Get.back(),
                              sessionController.logOut(),
                              EasyLoading.showSuccess('Great Success!').then((value) => controller.getCurrentUser()),
                            },
                          );
                  },
                  title: Text(
                    controller.currentUser == null ? 'Login' : 'Logout',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: controller.currentUser == null ? AppColors.BLUE : AppColors.ORANGE,
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
