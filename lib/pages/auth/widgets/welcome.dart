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
    return GetBuilder<AuthScreenController>(
      init: AuthScreenController(),
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
                  controller.setAuthScreenType(AuthScreenType.signIn),
                },
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: AppColors.PRIMARY,
                        fontSize: 24,
                      ),
                ),
              ),
              TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () => {
                  controller.setAuthScreenType(AuthScreenType.signUp),
                },
                child: Text(
                  'Registration',
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
