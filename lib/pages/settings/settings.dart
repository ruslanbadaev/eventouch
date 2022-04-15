import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin {
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
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Уведомления',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.PRIMARY,
                          fontSize: 14,
                        ),
                  ),
                  subtitle: Text(
                    'Выключены',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.BLACK,
                          fontSize: 18,
                        ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Уведомления',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.PRIMARY,
                          fontSize: 14,
                        ),
                  ),
                  subtitle: Text(
                    'Выключены',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.BLACK,
                          fontSize: 18,
                        ),
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Get.back(),
                    sessionController.logout(),
                  },
                  title: Text(
                    'Выход',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: AppColors.RED,
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
