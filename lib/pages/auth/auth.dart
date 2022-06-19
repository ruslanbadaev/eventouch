import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';
import '../../utils/constants/colors.dart';
import 'controller.dart';
import 'widgets/sign_in.dart';
import 'widgets/sign_up.dart';
import 'widgets/welcome.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<AuthScreenController>(
      init: AuthScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: _screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(gradient: AppColors.getShuffledGradient()),
              ),
              Positioned(
                top: 36,
                left: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: AppColors.PRIMARY,
                    size: 36,
                  ),
                  onPressed: () => {Get.off(App())},
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 146),
                  child: Column(
                    children: [
                      FadeInDown(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 48.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'PRES',
                                style: TextStyle(color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: '7',
                                style: TextStyle(color: AppColors.WHITE, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: 'T',
                                style: TextStyle(color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeInUp(
                        child: Text(
                          'Registration',
                          style: TextStyle(
                              color: AppColors.WHITE.withOpacity(.7), fontWeight: FontWeight.w400, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUpBig(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: _authWidget(authType: controller.authType, controller: controller),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _authWidget({
    required AuthScreenType authType,
    required AuthScreenController controller,
  }) {
    if (authType == AuthScreenType.signIn) {
      return SignInWidget();
    } else if (authType == AuthScreenType.signUp) {
      return SignUpWidget(
        onConfirm: () => controller.setAuthScreenType(AuthScreenType.welcome),
        onBack: () => controller.setAuthScreenType(AuthScreenType.welcome),
      );
    } else {
      return WelcomeWidget();
    }
  }
}
