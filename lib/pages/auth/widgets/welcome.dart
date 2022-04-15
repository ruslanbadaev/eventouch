import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../controller.dart';

class WelcomeWidget extends StatefulWidget {
  WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> with TickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 36),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () => {
                  controller.setAuthType(AuthType.signIn),
                },
                child: Text(
                  'Вход',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: AppColors.PRIMARY,
                        fontSize: 24,
                      ),
                ),
              ),
              TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () => {
                  controller.setAuthType(AuthType.signUp),
                },
                child: Text(
                  'Регистрация',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: AppColors.BLACK.withOpacity(.5),
                        fontSize: 24,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
