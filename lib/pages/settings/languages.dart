import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import 'controller.dart';

class LanguagesScreen extends StatefulWidget {
  LanguagesScreen({Key? key}) : super(key: key);

  @override
  _LanguagesScreensState createState() => _LanguagesScreensState();
}

class _LanguagesScreensState extends State<LanguagesScreen> with TickerProviderStateMixin {
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
          appBar: AppBar(
            backgroundColor: AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
            title: Text(
              'Select language',
              style: AdaptiveTheme.of(context).theme.textTheme.headline1,
            ),
            iconTheme: AdaptiveTheme.of(context).theme.iconTheme,
          ),
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'English',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                  ),
                  trailing: Icon(
                    Icons.flag_rounded,
                    color: AdaptiveTheme.of(context).theme.iconTheme.color,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Vietnamese',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                  ),
                  trailing: Icon(
                    Icons.flag_rounded,
                    color: AdaptiveTheme.of(context).theme.iconTheme.color,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Russian',
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyText1,
                  ),
                  trailing: Icon(
                    Icons.flag_rounded,
                    color: AdaptiveTheme.of(context).theme.iconTheme.color,
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
